library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity int_to_float is
    port (
        a : in std_logic_vector (23 downto 0);
        b : out std_logic_vector (31 downto 0)
    );
end entity;

architecture rtl of int_to_float is

    -- conversion functions
    function hc_uns(a : std_logic)        return unsigned         is variable b : unsigned(0 downto 0); begin b(0) := a; return b; end;
    function hc_uns(a : std_logic_vector) return unsigned         is begin return unsigned(a); end;
    function hc_sgn(a : std_logic)        return signed           is variable b : signed(0 downto 0); begin b(0) := a; return b; end;
    function hc_sgn(a : std_logic_vector) return signed           is begin return signed(a); end;
    function hc_sl (a : std_logic_vector) return std_logic        is begin return a(a'right); end;
    function hc_sl (a : unsigned)         return std_logic        is begin return a(a'right); end;
    function hc_sl (a : signed)           return std_logic        is begin return a(a'right); end;
    function hc_sl (a : boolean)          return std_logic        is begin if a then return '1'; else return '0'; end if; end;
    function hc_slv(a : std_logic_vector) return std_logic_vector is begin return a; end;
    function hc_slv(a : unsigned)         return std_logic_vector is begin return std_logic_vector(a); end;
    function hc_slv(a : signed)           return std_logic_vector is begin return std_logic_vector(a); end;

    -- signal declarations
    constant hc_406 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
    signal hc_404 : std_logic;
    signal hc_403 : std_logic;
    signal hc_402 : std_logic;
    signal hc_401 : std_logic;
    signal hc_400 : std_logic;
    signal hc_399 : std_logic;
    signal hc_398 : std_logic;
    signal hc_397 : std_logic;
    signal hc_396 : std_logic;
    signal hc_395 : std_logic;
    signal hc_394 : std_logic;
    signal hc_393 : std_logic;
    signal hc_392 : std_logic;
    signal hc_391 : std_logic;
    signal hc_390 : std_logic;
    signal hc_389 : std_logic;
    signal hc_388 : std_logic;
    signal hc_387 : std_logic;
    signal hc_386 : std_logic;
    signal hc_385 : std_logic;
    signal hc_384 : std_logic;
    signal hc_383 : std_logic;
    constant hc_373 : std_logic := '0';
    signal hc_372 : std_logic_vector (22 downto 0);
    signal hc_374 : std_logic_vector (23 downto 0);
    signal hc_375 : std_logic_vector (22 downto 0);
    constant hc_369 : std_logic_vector (1 downto 0) := "00";
    signal hc_368 : std_logic_vector (21 downto 0);
    signal hc_370 : std_logic_vector (23 downto 0);
    signal hc_371 : std_logic_vector (22 downto 0);
    signal hc_376 : std_logic_vector (22 downto 0);
    constant hc_364 : std_logic_vector (2 downto 0) := "000";
    signal hc_363 : std_logic_vector (20 downto 0);
    signal hc_365 : std_logic_vector (23 downto 0);
    signal hc_366 : std_logic_vector (22 downto 0);
    constant hc_360 : std_logic_vector (3 downto 0) := "0000";
    signal hc_359 : std_logic_vector (19 downto 0);
    signal hc_361 : std_logic_vector (23 downto 0);
    signal hc_362 : std_logic_vector (22 downto 0);
    signal hc_367 : std_logic_vector (22 downto 0);
    signal hc_377 : std_logic_vector (22 downto 0);
    constant hc_354 : std_logic_vector (4 downto 0) := "00000";
    signal hc_353 : std_logic_vector (18 downto 0);
    signal hc_355 : std_logic_vector (23 downto 0);
    signal hc_356 : std_logic_vector (22 downto 0);
    constant hc_350 : std_logic_vector (5 downto 0) := "000000";
    signal hc_349 : std_logic_vector (17 downto 0);
    signal hc_351 : std_logic_vector (23 downto 0);
    signal hc_352 : std_logic_vector (22 downto 0);
    signal hc_357 : std_logic_vector (22 downto 0);
    constant hc_345 : std_logic_vector (6 downto 0) := "0000000";
    signal hc_344 : std_logic_vector (16 downto 0);
    signal hc_346 : std_logic_vector (23 downto 0);
    signal hc_347 : std_logic_vector (22 downto 0);
    constant hc_341 : std_logic_vector (7 downto 0) := "00000000";
    signal hc_340 : std_logic_vector (15 downto 0);
    signal hc_342 : std_logic_vector (23 downto 0);
    signal hc_343 : std_logic_vector (22 downto 0);
    signal hc_348 : std_logic_vector (22 downto 0);
    signal hc_358 : std_logic_vector (22 downto 0);
    signal hc_378 : std_logic_vector (22 downto 0);
    constant hc_334 : std_logic_vector (8 downto 0) := "000000000";
    signal hc_333 : std_logic_vector (14 downto 0);
    signal hc_335 : std_logic_vector (23 downto 0);
    signal hc_336 : std_logic_vector (22 downto 0);
    constant hc_330 : std_logic_vector (9 downto 0) := "0000000000";
    signal hc_329 : std_logic_vector (13 downto 0);
    signal hc_331 : std_logic_vector (23 downto 0);
    signal hc_332 : std_logic_vector (22 downto 0);
    signal hc_337 : std_logic_vector (22 downto 0);
    constant hc_325 : std_logic_vector (10 downto 0) := "00000000000";
    signal hc_324 : std_logic_vector (12 downto 0);
    signal hc_326 : std_logic_vector (23 downto 0);
    signal hc_327 : std_logic_vector (22 downto 0);
    constant hc_321 : std_logic_vector (11 downto 0) := "000000000000";
    signal hc_320 : std_logic_vector (11 downto 0);
    signal hc_322 : std_logic_vector (23 downto 0);
    signal hc_323 : std_logic_vector (22 downto 0);
    signal hc_328 : std_logic_vector (22 downto 0);
    signal hc_338 : std_logic_vector (22 downto 0);
    constant hc_315 : std_logic_vector (12 downto 0) := "0000000000000";
    signal hc_314 : std_logic_vector (10 downto 0);
    signal hc_316 : std_logic_vector (23 downto 0);
    signal hc_317 : std_logic_vector (22 downto 0);
    constant hc_311 : std_logic_vector (13 downto 0) := "00000000000000";
    signal hc_310 : std_logic_vector (9 downto 0);
    signal hc_312 : std_logic_vector (23 downto 0);
    signal hc_313 : std_logic_vector (22 downto 0);
    signal hc_318 : std_logic_vector (22 downto 0);
    constant hc_306 : std_logic_vector (14 downto 0) := "000000000000000";
    signal hc_305 : std_logic_vector (8 downto 0);
    signal hc_307 : std_logic_vector (23 downto 0);
    signal hc_308 : std_logic_vector (22 downto 0);
    constant hc_302 : std_logic_vector (15 downto 0) := "0000000000000000";
    signal hc_301 : std_logic_vector (7 downto 0);
    signal hc_303 : std_logic_vector (23 downto 0);
    signal hc_304 : std_logic_vector (22 downto 0);
    signal hc_309 : std_logic_vector (22 downto 0);
    signal hc_319 : std_logic_vector (22 downto 0);
    signal hc_339 : std_logic_vector (22 downto 0);
    signal hc_379 : std_logic_vector (22 downto 0);
    constant hc_295 : std_logic_vector (16 downto 0) := "00000000000000000";
    signal hc_294 : std_logic_vector (6 downto 0);
    signal hc_296 : std_logic_vector (23 downto 0);
    signal hc_297 : std_logic_vector (22 downto 0);
    constant hc_291 : std_logic_vector (17 downto 0) := "000000000000000000";
    signal hc_290 : std_logic_vector (5 downto 0);
    signal hc_292 : std_logic_vector (23 downto 0);
    signal hc_293 : std_logic_vector (22 downto 0);
    signal hc_298 : std_logic_vector (22 downto 0);
    constant hc_286 : std_logic_vector (18 downto 0) := "0000000000000000000";
    signal hc_285 : std_logic_vector (4 downto 0);
    signal hc_287 : std_logic_vector (23 downto 0);
    signal hc_288 : std_logic_vector (22 downto 0);
    constant hc_282 : std_logic_vector (19 downto 0) := "00000000000000000000";
    signal hc_281 : std_logic_vector (3 downto 0);
    signal hc_283 : std_logic_vector (23 downto 0);
    signal hc_284 : std_logic_vector (22 downto 0);
    signal hc_289 : std_logic_vector (22 downto 0);
    signal hc_299 : std_logic_vector (22 downto 0);
    constant hc_276 : std_logic_vector (20 downto 0) := "000000000000000000000";
    signal hc_275 : std_logic_vector (2 downto 0);
    signal hc_277 : std_logic_vector (23 downto 0);
    signal hc_278 : std_logic_vector (22 downto 0);
    constant hc_272 : std_logic_vector (21 downto 0) := "0000000000000000000000";
    signal hc_271 : std_logic_vector (1 downto 0);
    signal hc_273 : std_logic_vector (23 downto 0);
    signal hc_274 : std_logic_vector (22 downto 0);
    signal hc_279 : std_logic_vector (22 downto 0);
    constant hc_267 : std_logic_vector (22 downto 0) := "00000000000000000000000";
    signal hc_266 : std_logic;
    signal hc_268 : std_logic_vector (23 downto 0);
    signal hc_269 : std_logic_vector (22 downto 0);
    constant hc_265 : std_logic_vector (22 downto 0) := "00000000000000000000000";
    signal hc_270 : std_logic_vector (22 downto 0);
    signal hc_280 : std_logic_vector (22 downto 0);
    signal hc_300 : std_logic_vector (22 downto 0);
    signal hc_380 : std_logic_vector (22 downto 0);
    constant hc_264 : std_logic_vector (22 downto 0) := "00000000000000000000000";
    signal hc_259 : std_logic;
    signal hc_258 : std_logic;
    signal hc_260 : std_logic;
    signal hc_256 : std_logic;
    signal hc_255 : std_logic;
    signal hc_257 : std_logic;
    signal hc_261 : std_logic;
    signal hc_252 : std_logic;
    signal hc_251 : std_logic;
    signal hc_253 : std_logic;
    signal hc_249 : std_logic;
    signal hc_248 : std_logic;
    signal hc_250 : std_logic;
    signal hc_254 : std_logic;
    signal hc_262 : std_logic;
    signal hc_243 : std_logic;
    signal hc_242 : std_logic;
    signal hc_244 : std_logic;
    signal hc_240 : std_logic;
    signal hc_239 : std_logic;
    signal hc_241 : std_logic;
    signal hc_245 : std_logic;
    signal hc_236 : std_logic;
    signal hc_235 : std_logic;
    signal hc_237 : std_logic;
    signal hc_233 : std_logic;
    signal hc_232 : std_logic;
    signal hc_234 : std_logic;
    signal hc_238 : std_logic;
    signal hc_246 : std_logic;
    signal hc_228 : std_logic;
    signal hc_227 : std_logic;
    signal hc_229 : std_logic;
    signal hc_225 : std_logic;
    signal hc_224 : std_logic;
    signal hc_226 : std_logic;
    signal hc_230 : std_logic;
    signal hc_221 : std_logic;
    signal hc_220 : std_logic;
    signal hc_222 : std_logic;
    signal hc_218 : std_logic;
    signal hc_215 : std_logic;
    signal hc_214 : std_logic;
    signal hc_213 : std_logic;
    signal hc_212 : std_logic;
    signal hc_211 : std_logic;
    signal hc_210 : std_logic;
    signal hc_209 : std_logic;
    signal hc_208 : std_logic;
    signal hc_207 : std_logic;
    signal hc_206 : std_logic;
    signal hc_205 : std_logic;
    signal hc_204 : std_logic;
    signal hc_203 : std_logic;
    signal hc_202 : std_logic;
    signal hc_201 : std_logic;
    signal hc_200 : std_logic;
    signal hc_199 : std_logic;
    signal hc_198 : std_logic;
    signal hc_197 : std_logic;
    signal hc_196 : std_logic;
    signal hc_195 : std_logic;
    signal hc_194 : std_logic;
    signal hc_193 : std_logic;
    signal hc_192 : std_logic;
    signal hc_216 : std_logic_vector (23 downto 0);
    signal hc_217 : std_logic;
    signal hc_219 : std_logic;
    signal hc_223 : std_logic;
    signal hc_231 : std_logic;
    signal hc_247 : std_logic;
    signal hc_263 : std_logic;
    signal hc_381 : std_logic_vector (22 downto 0);
    signal hc_382 : std_logic;
    signal hc_191 : std_logic;
    signal hc_190 : std_logic;
    signal hc_189 : std_logic;
    signal hc_188 : std_logic;
    signal hc_187 : std_logic;
    signal hc_186 : std_logic;
    signal hc_185 : std_logic;
    constant hc_182 : std_logic_vector (7 downto 0) := "01111111";
    constant hc_180 : std_logic_vector (7 downto 0) := "00000001";
    signal hc_181 : std_logic_vector (7 downto 0);
    signal hc_183 : std_logic_vector (7 downto 0);
    signal hc_184 : std_logic;
    signal hc_179 : std_logic;
    signal hc_405 : std_logic_vector (31 downto 0);
    constant hc_177 : std_logic_vector (7 downto 0) := "00000000";
    constant hc_170 : std_logic_vector (7 downto 0) := "00011000";
    constant hc_169 : std_logic_vector (7 downto 0) := "00010111";
    signal hc_171 : std_logic_vector (7 downto 0);
    constant hc_167 : std_logic_vector (7 downto 0) := "00010110";
    constant hc_166 : std_logic_vector (7 downto 0) := "00010101";
    signal hc_168 : std_logic_vector (7 downto 0);
    signal hc_172 : std_logic_vector (7 downto 0);
    constant hc_163 : std_logic_vector (7 downto 0) := "00010100";
    constant hc_162 : std_logic_vector (7 downto 0) := "00010011";
    signal hc_164 : std_logic_vector (7 downto 0);
    constant hc_160 : std_logic_vector (7 downto 0) := "00010010";
    constant hc_159 : std_logic_vector (7 downto 0) := "00010001";
    signal hc_161 : std_logic_vector (7 downto 0);
    signal hc_165 : std_logic_vector (7 downto 0);
    signal hc_173 : std_logic_vector (7 downto 0);
    constant hc_155 : std_logic_vector (7 downto 0) := "00010000";
    constant hc_154 : std_logic_vector (7 downto 0) := "00001111";
    signal hc_156 : std_logic_vector (7 downto 0);
    constant hc_152 : std_logic_vector (7 downto 0) := "00001110";
    constant hc_151 : std_logic_vector (7 downto 0) := "00001101";
    signal hc_153 : std_logic_vector (7 downto 0);
    signal hc_157 : std_logic_vector (7 downto 0);
    constant hc_148 : std_logic_vector (7 downto 0) := "00001100";
    constant hc_147 : std_logic_vector (7 downto 0) := "00001011";
    signal hc_149 : std_logic_vector (7 downto 0);
    constant hc_145 : std_logic_vector (7 downto 0) := "00001010";
    constant hc_144 : std_logic_vector (7 downto 0) := "00001001";
    signal hc_146 : std_logic_vector (7 downto 0);
    signal hc_150 : std_logic_vector (7 downto 0);
    signal hc_158 : std_logic_vector (7 downto 0);
    signal hc_174 : std_logic_vector (7 downto 0);
    constant hc_140 : std_logic_vector (7 downto 0) := "00001000";
    constant hc_139 : std_logic_vector (7 downto 0) := "00000111";
    signal hc_141 : std_logic_vector (7 downto 0);
    constant hc_137 : std_logic_vector (7 downto 0) := "00000110";
    constant hc_136 : std_logic_vector (7 downto 0) := "00000101";
    signal hc_138 : std_logic_vector (7 downto 0);
    signal hc_142 : std_logic_vector (7 downto 0);
    constant hc_133 : std_logic_vector (7 downto 0) := "00000100";
    constant hc_132 : std_logic_vector (7 downto 0) := "00000011";
    signal hc_134 : std_logic_vector (7 downto 0);
    constant hc_130 : std_logic_vector (7 downto 0) := "00000010";
    constant hc_129 : std_logic_vector (7 downto 0) := "00000001";
    signal hc_131 : std_logic_vector (7 downto 0);
    signal hc_135 : std_logic_vector (7 downto 0);
    signal hc_143 : std_logic_vector (7 downto 0);
    signal hc_175 : std_logic_vector (7 downto 0);
    constant hc_128 : std_logic_vector (7 downto 0) := "00000000";
    signal hc_123 : std_logic;
    signal hc_122 : std_logic;
    signal hc_124 : std_logic;
    signal hc_120 : std_logic;
    signal hc_119 : std_logic;
    signal hc_121 : std_logic;
    signal hc_125 : std_logic;
    signal hc_116 : std_logic;
    signal hc_115 : std_logic;
    signal hc_117 : std_logic;
    signal hc_113 : std_logic;
    signal hc_112 : std_logic;
    signal hc_114 : std_logic;
    signal hc_118 : std_logic;
    signal hc_126 : std_logic;
    signal hc_107 : std_logic;
    signal hc_106 : std_logic;
    signal hc_108 : std_logic;
    signal hc_104 : std_logic;
    signal hc_103 : std_logic;
    signal hc_105 : std_logic;
    signal hc_109 : std_logic;
    signal hc_100 : std_logic;
    signal hc_99 : std_logic;
    signal hc_101 : std_logic;
    signal hc_97 : std_logic;
    signal hc_96 : std_logic;
    signal hc_98 : std_logic;
    signal hc_102 : std_logic;
    signal hc_110 : std_logic;
    signal hc_92 : std_logic;
    signal hc_91 : std_logic;
    signal hc_93 : std_logic;
    signal hc_89 : std_logic;
    signal hc_88 : std_logic;
    signal hc_90 : std_logic;
    signal hc_94 : std_logic;
    signal hc_85 : std_logic;
    signal hc_84 : std_logic;
    signal hc_86 : std_logic;
    signal hc_82 : std_logic;
    signal hc_79 : std_logic;
    signal hc_78 : std_logic;
    signal hc_77 : std_logic;
    signal hc_76 : std_logic;
    signal hc_75 : std_logic;
    signal hc_74 : std_logic;
    signal hc_73 : std_logic;
    signal hc_72 : std_logic;
    signal hc_71 : std_logic;
    signal hc_70 : std_logic;
    signal hc_69 : std_logic;
    signal hc_68 : std_logic;
    signal hc_67 : std_logic;
    signal hc_66 : std_logic;
    signal hc_65 : std_logic;
    signal hc_64 : std_logic;
    signal hc_63 : std_logic;
    signal hc_62 : std_logic;
    signal hc_61 : std_logic;
    signal hc_60 : std_logic;
    signal hc_59 : std_logic;
    signal hc_58 : std_logic;
    signal hc_57 : std_logic;
    signal hc_52 : std_logic;
    signal hc_53 : std_logic;
    signal hc_50 : std_logic;
    signal hc_51 : std_logic;
    signal hc_48 : std_logic;
    signal hc_49 : std_logic;
    signal hc_46 : std_logic;
    signal hc_47 : std_logic;
    signal hc_44 : std_logic;
    signal hc_45 : std_logic;
    signal hc_42 : std_logic;
    signal hc_43 : std_logic;
    signal hc_40 : std_logic;
    signal hc_41 : std_logic;
    signal hc_38 : std_logic;
    signal hc_39 : std_logic;
    signal hc_36 : std_logic;
    signal hc_37 : std_logic;
    signal hc_34 : std_logic;
    signal hc_35 : std_logic;
    signal hc_32 : std_logic;
    signal hc_33 : std_logic;
    signal hc_30 : std_logic;
    signal hc_31 : std_logic;
    signal hc_28 : std_logic;
    signal hc_29 : std_logic;
    signal hc_26 : std_logic;
    signal hc_27 : std_logic;
    signal hc_24 : std_logic;
    signal hc_25 : std_logic;
    signal hc_22 : std_logic;
    signal hc_23 : std_logic;
    signal hc_20 : std_logic;
    signal hc_21 : std_logic;
    signal hc_18 : std_logic;
    signal hc_19 : std_logic;
    signal hc_16 : std_logic;
    signal hc_17 : std_logic;
    signal hc_14 : std_logic;
    signal hc_15 : std_logic;
    signal hc_12 : std_logic;
    signal hc_13 : std_logic;
    signal hc_10 : std_logic;
    signal hc_11 : std_logic;
    signal hc_8 : std_logic;
    signal hc_9 : std_logic;
    constant hc_4 : std_logic_vector (23 downto 0) := "000000000000000000000001";
    signal hc_5 : std_logic_vector (23 downto 0);
    signal hc_6 : std_logic;
    signal hc_7 : std_logic;
    signal hc_54 : std_logic_vector (23 downto 0);
    signal hc_3 : std_logic;
    signal hc_55 : std_logic_vector (23 downto 0);
    signal hc_56 : std_logic;
    signal hc_80 : std_logic_vector (23 downto 0);
    signal hc_81 : std_logic;
    signal hc_83 : std_logic;
    signal hc_87 : std_logic;
    signal hc_95 : std_logic;
    signal hc_111 : std_logic;
    signal hc_127 : std_logic;
    signal hc_176 : std_logic_vector (7 downto 0);
    signal hc_178 : std_logic;
    signal hc_407 : std_logic_vector (31 downto 0);

begin

    -- logic
    hc_404 <= hc_sl(hc_381(0 downto 0));
    hc_403 <= hc_sl(hc_381(1 downto 1));
    hc_402 <= hc_sl(hc_381(2 downto 2));
    hc_401 <= hc_sl(hc_381(3 downto 3));
    hc_400 <= hc_sl(hc_381(4 downto 4));
    hc_399 <= hc_sl(hc_381(5 downto 5));
    hc_398 <= hc_sl(hc_381(6 downto 6));
    hc_397 <= hc_sl(hc_381(7 downto 7));
    hc_396 <= hc_sl(hc_381(8 downto 8));
    hc_395 <= hc_sl(hc_381(9 downto 9));
    hc_394 <= hc_sl(hc_381(10 downto 10));
    hc_393 <= hc_sl(hc_381(11 downto 11));
    hc_392 <= hc_sl(hc_381(12 downto 12));
    hc_391 <= hc_sl(hc_381(13 downto 13));
    hc_390 <= hc_sl(hc_381(14 downto 14));
    hc_389 <= hc_sl(hc_381(15 downto 15));
    hc_388 <= hc_sl(hc_381(16 downto 16));
    hc_387 <= hc_sl(hc_381(17 downto 17));
    hc_386 <= hc_sl(hc_381(18 downto 18));
    hc_385 <= hc_sl(hc_381(19 downto 19));
    hc_384 <= hc_sl(hc_381(20 downto 20));
    hc_383 <= hc_sl(hc_381(21 downto 21));
    hc_372 <= hc_55(22 downto 0);
    hc_374 <= hc_372 & hc_373;
    hc_375 <= hc_374(23 downto 1);
    hc_368 <= hc_55(21 downto 0);
    hc_370 <= hc_368 & hc_369;
    hc_371 <= hc_370(23 downto 1);
    with to_integer(hc_uns(hc_217)) select hc_376 <= 
        hc_371 when 0,
        hc_375 when others;
    hc_363 <= hc_55(20 downto 0);
    hc_365 <= hc_363 & hc_364;
    hc_366 <= hc_365(23 downto 1);
    hc_359 <= hc_55(19 downto 0);
    hc_361 <= hc_359 & hc_360;
    hc_362 <= hc_361(23 downto 1);
    with to_integer(hc_uns(hc_220)) select hc_367 <= 
        hc_362 when 0,
        hc_366 when others;
    with to_integer(hc_uns(hc_219)) select hc_377 <= 
        hc_367 when 0,
        hc_376 when others;
    hc_353 <= hc_55(18 downto 0);
    hc_355 <= hc_353 & hc_354;
    hc_356 <= hc_355(23 downto 1);
    hc_349 <= hc_55(17 downto 0);
    hc_351 <= hc_349 & hc_350;
    hc_352 <= hc_351(23 downto 1);
    with to_integer(hc_uns(hc_224)) select hc_357 <= 
        hc_352 when 0,
        hc_356 when others;
    hc_344 <= hc_55(16 downto 0);
    hc_346 <= hc_344 & hc_345;
    hc_347 <= hc_346(23 downto 1);
    hc_340 <= hc_55(15 downto 0);
    hc_342 <= hc_340 & hc_341;
    hc_343 <= hc_342(23 downto 1);
    with to_integer(hc_uns(hc_227)) select hc_348 <= 
        hc_343 when 0,
        hc_347 when others;
    with to_integer(hc_uns(hc_226)) select hc_358 <= 
        hc_348 when 0,
        hc_357 when others;
    with to_integer(hc_uns(hc_223)) select hc_378 <= 
        hc_358 when 0,
        hc_377 when others;
    hc_333 <= hc_55(14 downto 0);
    hc_335 <= hc_333 & hc_334;
    hc_336 <= hc_335(23 downto 1);
    hc_329 <= hc_55(13 downto 0);
    hc_331 <= hc_329 & hc_330;
    hc_332 <= hc_331(23 downto 1);
    with to_integer(hc_uns(hc_232)) select hc_337 <= 
        hc_332 when 0,
        hc_336 when others;
    hc_324 <= hc_55(12 downto 0);
    hc_326 <= hc_324 & hc_325;
    hc_327 <= hc_326(23 downto 1);
    hc_320 <= hc_55(11 downto 0);
    hc_322 <= hc_320 & hc_321;
    hc_323 <= hc_322(23 downto 1);
    with to_integer(hc_uns(hc_235)) select hc_328 <= 
        hc_323 when 0,
        hc_327 when others;
    with to_integer(hc_uns(hc_234)) select hc_338 <= 
        hc_328 when 0,
        hc_337 when others;
    hc_314 <= hc_55(10 downto 0);
    hc_316 <= hc_314 & hc_315;
    hc_317 <= hc_316(23 downto 1);
    hc_310 <= hc_55(9 downto 0);
    hc_312 <= hc_310 & hc_311;
    hc_313 <= hc_312(23 downto 1);
    with to_integer(hc_uns(hc_239)) select hc_318 <= 
        hc_313 when 0,
        hc_317 when others;
    hc_305 <= hc_55(8 downto 0);
    hc_307 <= hc_305 & hc_306;
    hc_308 <= hc_307(23 downto 1);
    hc_301 <= hc_55(7 downto 0);
    hc_303 <= hc_301 & hc_302;
    hc_304 <= hc_303(23 downto 1);
    with to_integer(hc_uns(hc_242)) select hc_309 <= 
        hc_304 when 0,
        hc_308 when others;
    with to_integer(hc_uns(hc_241)) select hc_319 <= 
        hc_309 when 0,
        hc_318 when others;
    with to_integer(hc_uns(hc_238)) select hc_339 <= 
        hc_319 when 0,
        hc_338 when others;
    with to_integer(hc_uns(hc_231)) select hc_379 <= 
        hc_339 when 0,
        hc_378 when others;
    hc_294 <= hc_55(6 downto 0);
    hc_296 <= hc_294 & hc_295;
    hc_297 <= hc_296(23 downto 1);
    hc_290 <= hc_55(5 downto 0);
    hc_292 <= hc_290 & hc_291;
    hc_293 <= hc_292(23 downto 1);
    with to_integer(hc_uns(hc_248)) select hc_298 <= 
        hc_293 when 0,
        hc_297 when others;
    hc_285 <= hc_55(4 downto 0);
    hc_287 <= hc_285 & hc_286;
    hc_288 <= hc_287(23 downto 1);
    hc_281 <= hc_55(3 downto 0);
    hc_283 <= hc_281 & hc_282;
    hc_284 <= hc_283(23 downto 1);
    with to_integer(hc_uns(hc_251)) select hc_289 <= 
        hc_284 when 0,
        hc_288 when others;
    with to_integer(hc_uns(hc_250)) select hc_299 <= 
        hc_289 when 0,
        hc_298 when others;
    hc_275 <= hc_55(2 downto 0);
    hc_277 <= hc_275 & hc_276;
    hc_278 <= hc_277(23 downto 1);
    hc_271 <= hc_55(1 downto 0);
    hc_273 <= hc_271 & hc_272;
    hc_274 <= hc_273(23 downto 1);
    with to_integer(hc_uns(hc_255)) select hc_279 <= 
        hc_274 when 0,
        hc_278 when others;
    hc_266 <= hc_sl(hc_55(0 downto 0));
    hc_268 <= hc_266 & hc_267;
    hc_269 <= hc_268(23 downto 1);
    with to_integer(hc_uns(hc_258)) select hc_270 <= 
        hc_265 when 0,
        hc_269 when others;
    with to_integer(hc_uns(hc_257)) select hc_280 <= 
        hc_270 when 0,
        hc_279 when others;
    with to_integer(hc_uns(hc_254)) select hc_300 <= 
        hc_280 when 0,
        hc_299 when others;
    with to_integer(hc_uns(hc_247)) select hc_380 <= 
        hc_300 when 0,
        hc_379 when others;
    hc_259 <= hc_sl(hc_216(23 downto 23));
    hc_258 <= hc_sl(hc_216(22 downto 22));
    hc_260 <= hc_sl(hc_uns(hc_258) or hc_uns(hc_259));
    hc_256 <= hc_sl(hc_216(21 downto 21));
    hc_255 <= hc_sl(hc_216(20 downto 20));
    hc_257 <= hc_sl(hc_uns(hc_255) or hc_uns(hc_256));
    hc_261 <= hc_sl(hc_uns(hc_257) or hc_uns(hc_260));
    hc_252 <= hc_sl(hc_216(19 downto 19));
    hc_251 <= hc_sl(hc_216(18 downto 18));
    hc_253 <= hc_sl(hc_uns(hc_251) or hc_uns(hc_252));
    hc_249 <= hc_sl(hc_216(17 downto 17));
    hc_248 <= hc_sl(hc_216(16 downto 16));
    hc_250 <= hc_sl(hc_uns(hc_248) or hc_uns(hc_249));
    hc_254 <= hc_sl(hc_uns(hc_250) or hc_uns(hc_253));
    hc_262 <= hc_sl(hc_uns(hc_254) or hc_uns(hc_261));
    hc_243 <= hc_sl(hc_216(15 downto 15));
    hc_242 <= hc_sl(hc_216(14 downto 14));
    hc_244 <= hc_sl(hc_uns(hc_242) or hc_uns(hc_243));
    hc_240 <= hc_sl(hc_216(13 downto 13));
    hc_239 <= hc_sl(hc_216(12 downto 12));
    hc_241 <= hc_sl(hc_uns(hc_239) or hc_uns(hc_240));
    hc_245 <= hc_sl(hc_uns(hc_241) or hc_uns(hc_244));
    hc_236 <= hc_sl(hc_216(11 downto 11));
    hc_235 <= hc_sl(hc_216(10 downto 10));
    hc_237 <= hc_sl(hc_uns(hc_235) or hc_uns(hc_236));
    hc_233 <= hc_sl(hc_216(9 downto 9));
    hc_232 <= hc_sl(hc_216(8 downto 8));
    hc_234 <= hc_sl(hc_uns(hc_232) or hc_uns(hc_233));
    hc_238 <= hc_sl(hc_uns(hc_234) or hc_uns(hc_237));
    hc_246 <= hc_sl(hc_uns(hc_238) or hc_uns(hc_245));
    hc_228 <= hc_sl(hc_216(7 downto 7));
    hc_227 <= hc_sl(hc_216(6 downto 6));
    hc_229 <= hc_sl(hc_uns(hc_227) or hc_uns(hc_228));
    hc_225 <= hc_sl(hc_216(5 downto 5));
    hc_224 <= hc_sl(hc_216(4 downto 4));
    hc_226 <= hc_sl(hc_uns(hc_224) or hc_uns(hc_225));
    hc_230 <= hc_sl(hc_uns(hc_226) or hc_uns(hc_229));
    hc_221 <= hc_sl(hc_216(3 downto 3));
    hc_220 <= hc_sl(hc_216(2 downto 2));
    hc_222 <= hc_sl(hc_uns(hc_220) or hc_uns(hc_221));
    hc_218 <= hc_sl(hc_216(1 downto 1));
    hc_215 <= hc_sl(hc_55(23 downto 23));
    hc_214 <= hc_sl(hc_55(22 downto 22));
    hc_213 <= hc_sl(hc_55(21 downto 21));
    hc_212 <= hc_sl(hc_55(20 downto 20));
    hc_211 <= hc_sl(hc_55(19 downto 19));
    hc_210 <= hc_sl(hc_55(18 downto 18));
    hc_209 <= hc_sl(hc_55(17 downto 17));
    hc_208 <= hc_sl(hc_55(16 downto 16));
    hc_207 <= hc_sl(hc_55(15 downto 15));
    hc_206 <= hc_sl(hc_55(14 downto 14));
    hc_205 <= hc_sl(hc_55(13 downto 13));
    hc_204 <= hc_sl(hc_55(12 downto 12));
    hc_203 <= hc_sl(hc_55(11 downto 11));
    hc_202 <= hc_sl(hc_55(10 downto 10));
    hc_201 <= hc_sl(hc_55(9 downto 9));
    hc_200 <= hc_sl(hc_55(8 downto 8));
    hc_199 <= hc_sl(hc_55(7 downto 7));
    hc_198 <= hc_sl(hc_55(6 downto 6));
    hc_197 <= hc_sl(hc_55(5 downto 5));
    hc_196 <= hc_sl(hc_55(4 downto 4));
    hc_195 <= hc_sl(hc_55(3 downto 3));
    hc_194 <= hc_sl(hc_55(2 downto 2));
    hc_193 <= hc_sl(hc_55(1 downto 1));
    hc_192 <= hc_sl(hc_55(0 downto 0));
    hc_216 <= hc_192 & hc_193 & hc_194 & hc_195 & hc_196 & hc_197 & hc_198 & hc_199 & hc_200 & hc_201 & hc_202 & hc_203 & hc_204 & hc_205 & hc_206 & hc_207 & hc_208 & hc_209 & hc_210 & hc_211 & hc_212 & hc_213 & hc_214 & hc_215;
    hc_217 <= hc_sl(hc_216(0 downto 0));
    hc_219 <= hc_sl(hc_uns(hc_217) or hc_uns(hc_218));
    hc_223 <= hc_sl(hc_uns(hc_219) or hc_uns(hc_222));
    hc_231 <= hc_sl(hc_uns(hc_223) or hc_uns(hc_230));
    hc_247 <= hc_sl(hc_uns(hc_231) or hc_uns(hc_246));
    hc_263 <= hc_sl(hc_uns(hc_247) or hc_uns(hc_262));
    with to_integer(hc_uns(hc_263)) select hc_381 <= 
        hc_264 when 0,
        hc_380 when others;
    hc_382 <= hc_sl(hc_381(22 downto 22));
    hc_191 <= hc_sl(hc_183(0 downto 0));
    hc_190 <= hc_sl(hc_183(1 downto 1));
    hc_189 <= hc_sl(hc_183(2 downto 2));
    hc_188 <= hc_sl(hc_183(3 downto 3));
    hc_187 <= hc_sl(hc_183(4 downto 4));
    hc_186 <= hc_sl(hc_183(5 downto 5));
    hc_185 <= hc_sl(hc_183(6 downto 6));
    hc_181 <= hc_slv(hc_uns(hc_176) - hc_uns(hc_180));
    hc_183 <= hc_slv(hc_uns(hc_181) + hc_uns(hc_182));
    hc_184 <= hc_sl(hc_183(7 downto 7));
    hc_179 <= hc_sl(a(23 downto 23));
    hc_405 <= hc_179 & hc_184 & hc_185 & hc_186 & hc_187 & hc_188 & hc_189 & hc_190 & hc_191 & hc_382 & hc_383 & hc_384 & hc_385 & hc_386 & hc_387 & hc_388 & hc_389 & hc_390 & hc_391 & hc_392 & hc_393 & hc_394 & hc_395 & hc_396 & hc_397 & hc_398 & hc_399 & hc_400 & hc_401 & hc_402 & hc_403 & hc_404;
    with to_integer(hc_uns(hc_81)) select hc_171 <= 
        hc_169 when 0,
        hc_170 when others;
    with to_integer(hc_uns(hc_84)) select hc_168 <= 
        hc_166 when 0,
        hc_167 when others;
    with to_integer(hc_uns(hc_83)) select hc_172 <= 
        hc_168 when 0,
        hc_171 when others;
    with to_integer(hc_uns(hc_88)) select hc_164 <= 
        hc_162 when 0,
        hc_163 when others;
    with to_integer(hc_uns(hc_91)) select hc_161 <= 
        hc_159 when 0,
        hc_160 when others;
    with to_integer(hc_uns(hc_90)) select hc_165 <= 
        hc_161 when 0,
        hc_164 when others;
    with to_integer(hc_uns(hc_87)) select hc_173 <= 
        hc_165 when 0,
        hc_172 when others;
    with to_integer(hc_uns(hc_96)) select hc_156 <= 
        hc_154 when 0,
        hc_155 when others;
    with to_integer(hc_uns(hc_99)) select hc_153 <= 
        hc_151 when 0,
        hc_152 when others;
    with to_integer(hc_uns(hc_98)) select hc_157 <= 
        hc_153 when 0,
        hc_156 when others;
    with to_integer(hc_uns(hc_103)) select hc_149 <= 
        hc_147 when 0,
        hc_148 when others;
    with to_integer(hc_uns(hc_106)) select hc_146 <= 
        hc_144 when 0,
        hc_145 when others;
    with to_integer(hc_uns(hc_105)) select hc_150 <= 
        hc_146 when 0,
        hc_149 when others;
    with to_integer(hc_uns(hc_102)) select hc_158 <= 
        hc_150 when 0,
        hc_157 when others;
    with to_integer(hc_uns(hc_95)) select hc_174 <= 
        hc_158 when 0,
        hc_173 when others;
    with to_integer(hc_uns(hc_112)) select hc_141 <= 
        hc_139 when 0,
        hc_140 when others;
    with to_integer(hc_uns(hc_115)) select hc_138 <= 
        hc_136 when 0,
        hc_137 when others;
    with to_integer(hc_uns(hc_114)) select hc_142 <= 
        hc_138 when 0,
        hc_141 when others;
    with to_integer(hc_uns(hc_119)) select hc_134 <= 
        hc_132 when 0,
        hc_133 when others;
    with to_integer(hc_uns(hc_122)) select hc_131 <= 
        hc_129 when 0,
        hc_130 when others;
    with to_integer(hc_uns(hc_121)) select hc_135 <= 
        hc_131 when 0,
        hc_134 when others;
    with to_integer(hc_uns(hc_118)) select hc_143 <= 
        hc_135 when 0,
        hc_142 when others;
    with to_integer(hc_uns(hc_111)) select hc_175 <= 
        hc_143 when 0,
        hc_174 when others;
    hc_123 <= hc_sl(hc_80(23 downto 23));
    hc_122 <= hc_sl(hc_80(22 downto 22));
    hc_124 <= hc_sl(hc_uns(hc_122) or hc_uns(hc_123));
    hc_120 <= hc_sl(hc_80(21 downto 21));
    hc_119 <= hc_sl(hc_80(20 downto 20));
    hc_121 <= hc_sl(hc_uns(hc_119) or hc_uns(hc_120));
    hc_125 <= hc_sl(hc_uns(hc_121) or hc_uns(hc_124));
    hc_116 <= hc_sl(hc_80(19 downto 19));
    hc_115 <= hc_sl(hc_80(18 downto 18));
    hc_117 <= hc_sl(hc_uns(hc_115) or hc_uns(hc_116));
    hc_113 <= hc_sl(hc_80(17 downto 17));
    hc_112 <= hc_sl(hc_80(16 downto 16));
    hc_114 <= hc_sl(hc_uns(hc_112) or hc_uns(hc_113));
    hc_118 <= hc_sl(hc_uns(hc_114) or hc_uns(hc_117));
    hc_126 <= hc_sl(hc_uns(hc_118) or hc_uns(hc_125));
    hc_107 <= hc_sl(hc_80(15 downto 15));
    hc_106 <= hc_sl(hc_80(14 downto 14));
    hc_108 <= hc_sl(hc_uns(hc_106) or hc_uns(hc_107));
    hc_104 <= hc_sl(hc_80(13 downto 13));
    hc_103 <= hc_sl(hc_80(12 downto 12));
    hc_105 <= hc_sl(hc_uns(hc_103) or hc_uns(hc_104));
    hc_109 <= hc_sl(hc_uns(hc_105) or hc_uns(hc_108));
    hc_100 <= hc_sl(hc_80(11 downto 11));
    hc_99 <= hc_sl(hc_80(10 downto 10));
    hc_101 <= hc_sl(hc_uns(hc_99) or hc_uns(hc_100));
    hc_97 <= hc_sl(hc_80(9 downto 9));
    hc_96 <= hc_sl(hc_80(8 downto 8));
    hc_98 <= hc_sl(hc_uns(hc_96) or hc_uns(hc_97));
    hc_102 <= hc_sl(hc_uns(hc_98) or hc_uns(hc_101));
    hc_110 <= hc_sl(hc_uns(hc_102) or hc_uns(hc_109));
    hc_92 <= hc_sl(hc_80(7 downto 7));
    hc_91 <= hc_sl(hc_80(6 downto 6));
    hc_93 <= hc_sl(hc_uns(hc_91) or hc_uns(hc_92));
    hc_89 <= hc_sl(hc_80(5 downto 5));
    hc_88 <= hc_sl(hc_80(4 downto 4));
    hc_90 <= hc_sl(hc_uns(hc_88) or hc_uns(hc_89));
    hc_94 <= hc_sl(hc_uns(hc_90) or hc_uns(hc_93));
    hc_85 <= hc_sl(hc_80(3 downto 3));
    hc_84 <= hc_sl(hc_80(2 downto 2));
    hc_86 <= hc_sl(hc_uns(hc_84) or hc_uns(hc_85));
    hc_82 <= hc_sl(hc_80(1 downto 1));
    hc_79 <= hc_sl(hc_55(23 downto 23));
    hc_78 <= hc_sl(hc_55(22 downto 22));
    hc_77 <= hc_sl(hc_55(21 downto 21));
    hc_76 <= hc_sl(hc_55(20 downto 20));
    hc_75 <= hc_sl(hc_55(19 downto 19));
    hc_74 <= hc_sl(hc_55(18 downto 18));
    hc_73 <= hc_sl(hc_55(17 downto 17));
    hc_72 <= hc_sl(hc_55(16 downto 16));
    hc_71 <= hc_sl(hc_55(15 downto 15));
    hc_70 <= hc_sl(hc_55(14 downto 14));
    hc_69 <= hc_sl(hc_55(13 downto 13));
    hc_68 <= hc_sl(hc_55(12 downto 12));
    hc_67 <= hc_sl(hc_55(11 downto 11));
    hc_66 <= hc_sl(hc_55(10 downto 10));
    hc_65 <= hc_sl(hc_55(9 downto 9));
    hc_64 <= hc_sl(hc_55(8 downto 8));
    hc_63 <= hc_sl(hc_55(7 downto 7));
    hc_62 <= hc_sl(hc_55(6 downto 6));
    hc_61 <= hc_sl(hc_55(5 downto 5));
    hc_60 <= hc_sl(hc_55(4 downto 4));
    hc_59 <= hc_sl(hc_55(3 downto 3));
    hc_58 <= hc_sl(hc_55(2 downto 2));
    hc_57 <= hc_sl(hc_55(1 downto 1));
    hc_52 <= hc_sl(hc_5(0 downto 0));
    hc_53 <= hc_sl(not hc_uns(hc_52));
    hc_50 <= hc_sl(hc_5(1 downto 1));
    hc_51 <= hc_sl(not hc_uns(hc_50));
    hc_48 <= hc_sl(hc_5(2 downto 2));
    hc_49 <= hc_sl(not hc_uns(hc_48));
    hc_46 <= hc_sl(hc_5(3 downto 3));
    hc_47 <= hc_sl(not hc_uns(hc_46));
    hc_44 <= hc_sl(hc_5(4 downto 4));
    hc_45 <= hc_sl(not hc_uns(hc_44));
    hc_42 <= hc_sl(hc_5(5 downto 5));
    hc_43 <= hc_sl(not hc_uns(hc_42));
    hc_40 <= hc_sl(hc_5(6 downto 6));
    hc_41 <= hc_sl(not hc_uns(hc_40));
    hc_38 <= hc_sl(hc_5(7 downto 7));
    hc_39 <= hc_sl(not hc_uns(hc_38));
    hc_36 <= hc_sl(hc_5(8 downto 8));
    hc_37 <= hc_sl(not hc_uns(hc_36));
    hc_34 <= hc_sl(hc_5(9 downto 9));
    hc_35 <= hc_sl(not hc_uns(hc_34));
    hc_32 <= hc_sl(hc_5(10 downto 10));
    hc_33 <= hc_sl(not hc_uns(hc_32));
    hc_30 <= hc_sl(hc_5(11 downto 11));
    hc_31 <= hc_sl(not hc_uns(hc_30));
    hc_28 <= hc_sl(hc_5(12 downto 12));
    hc_29 <= hc_sl(not hc_uns(hc_28));
    hc_26 <= hc_sl(hc_5(13 downto 13));
    hc_27 <= hc_sl(not hc_uns(hc_26));
    hc_24 <= hc_sl(hc_5(14 downto 14));
    hc_25 <= hc_sl(not hc_uns(hc_24));
    hc_22 <= hc_sl(hc_5(15 downto 15));
    hc_23 <= hc_sl(not hc_uns(hc_22));
    hc_20 <= hc_sl(hc_5(16 downto 16));
    hc_21 <= hc_sl(not hc_uns(hc_20));
    hc_18 <= hc_sl(hc_5(17 downto 17));
    hc_19 <= hc_sl(not hc_uns(hc_18));
    hc_16 <= hc_sl(hc_5(18 downto 18));
    hc_17 <= hc_sl(not hc_uns(hc_16));
    hc_14 <= hc_sl(hc_5(19 downto 19));
    hc_15 <= hc_sl(not hc_uns(hc_14));
    hc_12 <= hc_sl(hc_5(20 downto 20));
    hc_13 <= hc_sl(not hc_uns(hc_12));
    hc_10 <= hc_sl(hc_5(21 downto 21));
    hc_11 <= hc_sl(not hc_uns(hc_10));
    hc_8 <= hc_sl(hc_5(22 downto 22));
    hc_9 <= hc_sl(not hc_uns(hc_8));
    hc_5 <= hc_slv(hc_uns(a) - hc_uns(hc_4));
    hc_6 <= hc_sl(hc_5(23 downto 23));
    hc_7 <= hc_sl(not hc_uns(hc_6));
    hc_54 <= hc_7 & hc_9 & hc_11 & hc_13 & hc_15 & hc_17 & hc_19 & hc_21 & hc_23 & hc_25 & hc_27 & hc_29 & hc_31 & hc_33 & hc_35 & hc_37 & hc_39 & hc_41 & hc_43 & hc_45 & hc_47 & hc_49 & hc_51 & hc_53;
    hc_3 <= hc_sl(a(23 downto 23));
    with to_integer(hc_uns(hc_3)) select hc_55 <= 
        a when 0,
        hc_54 when others;
    hc_56 <= hc_sl(hc_55(0 downto 0));
    hc_80 <= hc_56 & hc_57 & hc_58 & hc_59 & hc_60 & hc_61 & hc_62 & hc_63 & hc_64 & hc_65 & hc_66 & hc_67 & hc_68 & hc_69 & hc_70 & hc_71 & hc_72 & hc_73 & hc_74 & hc_75 & hc_76 & hc_77 & hc_78 & hc_79;
    hc_81 <= hc_sl(hc_80(0 downto 0));
    hc_83 <= hc_sl(hc_uns(hc_81) or hc_uns(hc_82));
    hc_87 <= hc_sl(hc_uns(hc_83) or hc_uns(hc_86));
    hc_95 <= hc_sl(hc_uns(hc_87) or hc_uns(hc_94));
    hc_111 <= hc_sl(hc_uns(hc_95) or hc_uns(hc_110));
    hc_127 <= hc_sl(hc_uns(hc_111) or hc_uns(hc_126));
    with to_integer(hc_uns(hc_127)) select hc_176 <= 
        hc_128 when 0,
        hc_175 when others;
    hc_178 <= hc_sl(hc_uns(hc_176) = hc_uns(hc_177));
    with to_integer(hc_uns(hc_178)) select hc_407 <= 
        hc_405 when 0,
        hc_406 when others;

    -- aliases

    -- output assignments
    b <= hc_407;

end architecture;
