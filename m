Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPm1Y-0004ry-PQ
	for mharc-qemu-riscv@gnu.org; Sun, 21 Aug 2022 10:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyang22@iscas.ac.cn>)
 id 1oPexb-0003Cl-2b; Sun, 21 Aug 2022 03:01:31 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39978 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liuyang22@iscas.ac.cn>)
 id 1oPexU-0003WV-HS; Sun, 21 Aug 2022 03:01:26 -0400
Received: from localhost.localdomain (unknown [182.37.30.21])
 by APP-05 (Coremail) with SMTP id zQCowAD3Fnwz2AFjO3R7Gw--.12592S2;
 Sun, 21 Aug 2022 15:01:07 +0800 (CST)
From: Yang Liu <liuyang22@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, liweiwei@iscas.ac.cn,
 Yang Liu <liuyang22@iscas.ac.cn>
Subject: [PATCH] disas/riscv.c: rvv: Add disas support for vector instructions
Date: Sun, 21 Aug 2022 15:00:47 +0800
Message-Id: <20220821070047.18176-1-liuyang22@iscas.ac.cn>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3Fnwz2AFjO3R7Gw--.12592S2
X-Coremail-Antispam: 1UD129KBjvAXoWDJw48Ww48Aw4fWF1kur1Dtrb_yoW3GF45Zo
 WUXrW5Ar4Fya13WrnrCa4fGasIqrnxGry7JF93W3ZxXFsIqry8WF15X3yvvF13KryrGa1j
 yFy0kFWkJ34xCr1Un29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYr7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_JrC_JFWl1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUFYFADU
 UUU
X-Originating-IP: [182.37.30.21]
X-CM-SenderInfo: 5olx5tdqjsjq5lvft2wodfhubq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=liuyang22@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Aug 2022 10:33:58 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Aug 2022 07:01:32 -0000

Tested with https://github.com/ksco/rvv-decoder-tests

Expected checkpatch errors for consistency and brevity reasons:

ERROR: line over 90 characters
ERROR: trailing statements should be on next line
ERROR: braces {} are necessary for all arms of this statement

Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
---
 disas/riscv.c | 1430 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 1428 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7af6afc8fa..e313e877f0 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -158,6 +158,11 @@ typedef enum {
     rv_codec_css_sqsp,
     rv_codec_k_bs,
     rv_codec_k_rnum,
+    rv_codec_v_r,
+    rv_codec_v_ldst,
+    rv_codec_v_i,
+    rv_codec_vsetvli,
+    rv_codec_vsetivli,
 } rv_codec;
 
 typedef enum {
@@ -560,6 +565,376 @@ typedef enum {
     rv_op_zip = 396,
     rv_op_xperm4 = 397,
     rv_op_xperm8 = 398,
+    rv_op_vle8_v = 399,
+    rv_op_vle16_v = 400,
+    rv_op_vle32_v = 401,
+    rv_op_vle64_v = 402,
+    rv_op_vse8_v = 403,
+    rv_op_vse16_v = 404,
+    rv_op_vse32_v = 405,
+    rv_op_vse64_v = 406,
+    rv_op_vlm_v = 407,
+    rv_op_vsm_v = 408,
+    rv_op_vlse8_v = 409,
+    rv_op_vlse16_v = 410,
+    rv_op_vlse32_v = 411,
+    rv_op_vlse64_v = 412,
+    rv_op_vsse8_v = 413,
+    rv_op_vsse16_v = 414,
+    rv_op_vsse32_v = 415,
+    rv_op_vsse64_v = 416,
+    rv_op_vluxei8_v = 417,
+    rv_op_vluxei16_v = 418,
+    rv_op_vluxei32_v = 419,
+    rv_op_vluxei64_v = 420,
+    rv_op_vloxei8_v = 421,
+    rv_op_vloxei16_v = 422,
+    rv_op_vloxei32_v = 423,
+    rv_op_vloxei64_v = 424,
+    rv_op_vsuxei8_v = 425,
+    rv_op_vsuxei16_v = 426,
+    rv_op_vsuxei32_v = 427,
+    rv_op_vsuxei64_v = 428,
+    rv_op_vsoxei8_v = 429,
+    rv_op_vsoxei16_v = 430,
+    rv_op_vsoxei32_v = 431,
+    rv_op_vsoxei64_v = 432,
+    rv_op_vle8ff_v = 433,
+    rv_op_vle16ff_v = 434,
+    rv_op_vle32ff_v = 435,
+    rv_op_vle64ff_v = 436,
+    rv_op_vl1re8_v = 437,
+    rv_op_vl1re16_v = 438,
+    rv_op_vl1re32_v = 439,
+    rv_op_vl1re64_v = 440,
+    rv_op_vl2re8_v = 441,
+    rv_op_vl2re16_v = 442,
+    rv_op_vl2re32_v = 443,
+    rv_op_vl2re64_v = 444,
+    rv_op_vl4re8_v = 445,
+    rv_op_vl4re16_v = 446,
+    rv_op_vl4re32_v = 447,
+    rv_op_vl4re64_v = 448,
+    rv_op_vl8re8_v = 449,
+    rv_op_vl8re16_v = 450,
+    rv_op_vl8re32_v = 451,
+    rv_op_vl8re64_v = 452,
+    rv_op_vs1r_v = 453,
+    rv_op_vs2r_v = 454,
+    rv_op_vs4r_v = 455,
+    rv_op_vs8r_v = 456,
+    rv_op_vadd_vv = 457,
+    rv_op_vadd_vx = 458,
+    rv_op_vadd_vi = 459,
+    rv_op_vsub_vv = 460,
+    rv_op_vsub_vx = 461,
+    rv_op_vrsub_vx = 462,
+    rv_op_vrsub_vi = 463,
+    rv_op_vwaddu_vv = 464,
+    rv_op_vwaddu_vx = 465,
+    rv_op_vwadd_vv = 466,
+    rv_op_vwadd_vx = 467,
+    rv_op_vwsubu_vv = 468,
+    rv_op_vwsubu_vx = 469,
+    rv_op_vwsub_vv = 470,
+    rv_op_vwsub_vx = 471,
+    rv_op_vwaddu_wv = 472,
+    rv_op_vwaddu_wx = 473,
+    rv_op_vwadd_wv = 474,
+    rv_op_vwadd_wx = 475,
+    rv_op_vwsubu_wv = 476,
+    rv_op_vwsubu_wx = 477,
+    rv_op_vwsub_wv = 478,
+    rv_op_vwsub_wx = 479,
+    rv_op_vadc_vvm = 480,
+    rv_op_vadc_vxm = 481,
+    rv_op_vadc_vim = 482,
+    rv_op_vmadc_vvm = 483,
+    rv_op_vmadc_vxm = 484,
+    rv_op_vmadc_vim = 485,
+    rv_op_vsbc_vvm = 486,
+    rv_op_vsbc_vxm = 487,
+    rv_op_vmsbc_vvm = 488,
+    rv_op_vmsbc_vxm = 489,
+    rv_op_vand_vv = 490,
+    rv_op_vand_vx = 491,
+    rv_op_vand_vi = 492,
+    rv_op_vor_vv = 493,
+    rv_op_vor_vx = 494,
+    rv_op_vor_vi = 495,
+    rv_op_vxor_vv = 496,
+    rv_op_vxor_vx = 497,
+    rv_op_vxor_vi = 498,
+    rv_op_vsll_vv = 499,
+    rv_op_vsll_vx = 500,
+    rv_op_vsll_vi = 501,
+    rv_op_vsrl_vv = 502,
+    rv_op_vsrl_vx = 503,
+    rv_op_vsrl_vi = 504,
+    rv_op_vsra_vv = 505,
+    rv_op_vsra_vx = 506,
+    rv_op_vsra_vi = 507,
+    rv_op_vnsrl_wv = 508,
+    rv_op_vnsrl_wx = 509,
+    rv_op_vnsrl_wi = 510,
+    rv_op_vnsra_wv = 511,
+    rv_op_vnsra_wx = 512,
+    rv_op_vnsra_wi = 513,
+    rv_op_vmseq_vv = 514,
+    rv_op_vmseq_vx = 515,
+    rv_op_vmseq_vi = 516,
+    rv_op_vmsne_vv = 517,
+    rv_op_vmsne_vx = 518,
+    rv_op_vmsne_vi = 519,
+    rv_op_vmsltu_vv = 520,
+    rv_op_vmsltu_vx = 521,
+    rv_op_vmslt_vv = 522,
+    rv_op_vmslt_vx = 523,
+    rv_op_vmsleu_vv = 524,
+    rv_op_vmsleu_vx = 525,
+    rv_op_vmsleu_vi = 526,
+    rv_op_vmsle_vv = 527,
+    rv_op_vmsle_vx = 528,
+    rv_op_vmsle_vi = 529,
+    rv_op_vmsgtu_vx = 530,
+    rv_op_vmsgtu_vi = 531,
+    rv_op_vmsgt_vx = 532,
+    rv_op_vmsgt_vi = 533,
+    rv_op_vminu_vv = 534,
+    rv_op_vminu_vx = 535,
+    rv_op_vmin_vv = 536,
+    rv_op_vmin_vx = 537,
+    rv_op_vmaxu_vv = 538,
+    rv_op_vmaxu_vx = 539,
+    rv_op_vmax_vv = 540,
+    rv_op_vmax_vx = 541,
+    rv_op_vmul_vv = 542,
+    rv_op_vmul_vx = 543,
+    rv_op_vmulh_vv = 544,
+    rv_op_vmulh_vx = 545,
+    rv_op_vmulhu_vv = 546,
+    rv_op_vmulhu_vx = 547,
+    rv_op_vmulhsu_vv = 548,
+    rv_op_vmulhsu_vx = 549,
+    rv_op_vdivu_vv = 550,
+    rv_op_vdivu_vx = 551,
+    rv_op_vdiv_vv = 552,
+    rv_op_vdiv_vx = 553,
+    rv_op_vremu_vv = 554,
+    rv_op_vremu_vx = 555,
+    rv_op_vrem_vv = 556,
+    rv_op_vrem_vx = 557,
+    rv_op_vwmulu_vv = 558,
+    rv_op_vwmulu_vx = 559,
+    rv_op_vwmulsu_vv = 560,
+    rv_op_vwmulsu_vx = 561,
+    rv_op_vwmul_vv = 562,
+    rv_op_vwmul_vx = 563,
+    rv_op_vmacc_vv = 564,
+    rv_op_vmacc_vx = 565,
+    rv_op_vnmsac_vv = 566,
+    rv_op_vnmsac_vx = 567,
+    rv_op_vmadd_vv = 568,
+    rv_op_vmadd_vx = 569,
+    rv_op_vnmsub_vv = 570,
+    rv_op_vnmsub_vx = 571,
+    rv_op_vwmaccu_vv = 572,
+    rv_op_vwmaccu_vx = 573,
+    rv_op_vwmacc_vv = 574,
+    rv_op_vwmacc_vx = 575,
+    rv_op_vwmaccsu_vv = 576,
+    rv_op_vwmaccsu_vx = 577,
+    rv_op_vwmaccus_vx = 578,
+    rv_op_vmv_v_v = 579,
+    rv_op_vmv_v_x = 580,
+    rv_op_vmv_v_i = 581,
+    rv_op_vmerge_vvm = 582,
+    rv_op_vmerge_vxm = 583,
+    rv_op_vmerge_vim = 584,
+    rv_op_vsaddu_vv = 585,
+    rv_op_vsaddu_vx = 586,
+    rv_op_vsaddu_vi = 587,
+    rv_op_vsadd_vv = 588,
+    rv_op_vsadd_vx = 589,
+    rv_op_vsadd_vi = 590,
+    rv_op_vssubu_vv = 591,
+    rv_op_vssubu_vx = 592,
+    rv_op_vssub_vv = 593,
+    rv_op_vssub_vx = 594,
+    rv_op_vaadd_vv = 595,
+    rv_op_vaadd_vx = 596,
+    rv_op_vaaddu_vv = 597,
+    rv_op_vaaddu_vx = 598,
+    rv_op_vasub_vv = 599,
+    rv_op_vasub_vx = 600,
+    rv_op_vasubu_vv = 601,
+    rv_op_vasubu_vx = 602,
+    rv_op_vsmul_vv = 603,
+    rv_op_vsmul_vx = 604,
+    rv_op_vssrl_vv = 605,
+    rv_op_vssrl_vx = 606,
+    rv_op_vssrl_vi = 607,
+    rv_op_vssra_vv = 608,
+    rv_op_vssra_vx = 609,
+    rv_op_vssra_vi = 610,
+    rv_op_vnclipu_wv = 611,
+    rv_op_vnclipu_wx = 612,
+    rv_op_vnclipu_wi = 613,
+    rv_op_vnclip_wv = 614,
+    rv_op_vnclip_wx = 615,
+    rv_op_vnclip_wi = 616,
+    rv_op_vfadd_vv = 617,
+    rv_op_vfadd_vf = 618,
+    rv_op_vfsub_vv = 619,
+    rv_op_vfsub_vf = 620,
+    rv_op_vfrsub_vf = 621,
+    rv_op_vfwadd_vv = 622,
+    rv_op_vfwadd_vf = 623,
+    rv_op_vfwadd_wv = 624,
+    rv_op_vfwadd_wf = 625,
+    rv_op_vfwsub_vv = 626,
+    rv_op_vfwsub_vf = 627,
+    rv_op_vfwsub_wv = 628,
+    rv_op_vfwsub_wf = 629,
+    rv_op_vfmul_vv = 630,
+    rv_op_vfmul_vf = 631,
+    rv_op_vfdiv_vv = 632,
+    rv_op_vfdiv_vf = 633,
+    rv_op_vfrdiv_vf = 634,
+    rv_op_vfwmul_vv = 635,
+    rv_op_vfwmul_vf = 636,
+    rv_op_vfmacc_vv = 637,
+    rv_op_vfmacc_vf = 638,
+    rv_op_vfnmacc_vv = 639,
+    rv_op_vfnmacc_vf = 640,
+    rv_op_vfmsac_vv = 641,
+    rv_op_vfmsac_vf = 642,
+    rv_op_vfnmsac_vv = 643,
+    rv_op_vfnmsac_vf = 644,
+    rv_op_vfmadd_vv = 645,
+    rv_op_vfmadd_vf = 646,
+    rv_op_vfnmadd_vv = 647,
+    rv_op_vfnmadd_vf = 648,
+    rv_op_vfmsub_vv = 649,
+    rv_op_vfmsub_vf = 650,
+    rv_op_vfnmsub_vv = 651,
+    rv_op_vfnmsub_vf = 652,
+    rv_op_vfwmacc_vv = 653,
+    rv_op_vfwmacc_vf = 654,
+    rv_op_vfwnmacc_vv = 655,
+    rv_op_vfwnmacc_vf = 656,
+    rv_op_vfwmsac_vv = 657,
+    rv_op_vfwmsac_vf = 658,
+    rv_op_vfwnmsac_vv = 659,
+    rv_op_vfwnmsac_vf = 660,
+    rv_op_vfsqrt_v = 661,
+    rv_op_vfrsqrt7_v = 662,
+    rv_op_vfrec7_v = 663,
+    rv_op_vfmin_vv = 664,
+    rv_op_vfmin_vf = 665,
+    rv_op_vfmax_vv = 666,
+    rv_op_vfmax_vf = 667,
+    rv_op_vfsgnj_vv = 668,
+    rv_op_vfsgnj_vf = 669,
+    rv_op_vfsgnjn_vv = 670,
+    rv_op_vfsgnjn_vf = 671,
+    rv_op_vfsgnjx_vv = 672,
+    rv_op_vfsgnjx_vf = 673,
+    rv_op_vfslide1up_vf = 674,
+    rv_op_vfslide1down_vf = 675,
+    rv_op_vmfeq_vv = 676,
+    rv_op_vmfeq_vf = 677,
+    rv_op_vmfne_vv = 678,
+    rv_op_vmfne_vf = 679,
+    rv_op_vmflt_vv = 680,
+    rv_op_vmflt_vf = 681,
+    rv_op_vmfle_vv = 682,
+    rv_op_vmfle_vf = 683,
+    rv_op_vmfgt_vf = 684,
+    rv_op_vmfge_vf = 685,
+    rv_op_vfclass_v = 686,
+    rv_op_vfmerge_vfm = 687,
+    rv_op_vfmv_v_f = 688,
+    rv_op_vfcvt_xu_f_v = 689,
+    rv_op_vfcvt_x_f_v = 690,
+    rv_op_vfcvt_f_xu_v = 691,
+    rv_op_vfcvt_f_x_v = 692,
+    rv_op_vfcvt_rtz_xu_f_v = 693,
+    rv_op_vfcvt_rtz_x_f_v = 694,
+    rv_op_vfwcvt_xu_f_v = 695,
+    rv_op_vfwcvt_x_f_v = 696,
+    rv_op_vfwcvt_f_xu_v = 697,
+    rv_op_vfwcvt_f_x_v = 698,
+    rv_op_vfwcvt_f_f_v = 699,
+    rv_op_vfwcvt_rtz_xu_f_v = 700,
+    rv_op_vfwcvt_rtz_x_f_v = 701,
+    rv_op_vfncvt_xu_f_w = 702,
+    rv_op_vfncvt_x_f_w = 703,
+    rv_op_vfncvt_f_xu_w = 704,
+    rv_op_vfncvt_f_x_w = 705,
+    rv_op_vfncvt_f_f_w = 706,
+    rv_op_vfncvt_rod_f_f_w = 707,
+    rv_op_vfncvt_rtz_xu_f_w = 708,
+    rv_op_vfncvt_rtz_x_f_w = 709,
+    rv_op_vredsum_vs = 710,
+    rv_op_vredand_vs = 711,
+    rv_op_vredor_vs = 712,
+    rv_op_vredxor_vs = 713,
+    rv_op_vredminu_vs = 714,
+    rv_op_vredmin_vs = 715,
+    rv_op_vredmaxu_vs = 716,
+    rv_op_vredmax_vs = 717,
+    rv_op_vwredsumu_vs = 718,
+    rv_op_vwredsum_vs = 719,
+    rv_op_vfredusum_vs = 720,
+    rv_op_vfredosum_vs = 721,
+    rv_op_vfredmin_vs = 722,
+    rv_op_vfredmax_vs = 723,
+    rv_op_vfwredusum_vs = 724,
+    rv_op_vfwredosum_vs = 725,
+    rv_op_vmand_mm = 726,
+    rv_op_vmnand_mm = 727,
+    rv_op_vmandn_mm = 728,
+    rv_op_vmxor_mm = 729,
+    rv_op_vmor_mm = 730,
+    rv_op_vmnor_mm = 731,
+    rv_op_vmorn_mm = 732,
+    rv_op_vmxnor_mm = 733,
+    rv_op_vcpop_m = 734,
+    rv_op_vfirst_m = 735,
+    rv_op_vmsbf_m = 736,
+    rv_op_vmsif_m = 737,
+    rv_op_vmsof_m = 738,
+    rv_op_viota_m = 739,
+    rv_op_vid_v = 740,
+    rv_op_vmv_x_s = 741,
+    rv_op_vmv_s_x = 742,
+    rv_op_vfmv_f_s = 743,
+    rv_op_vfmv_s_f = 744,
+    rv_op_vslideup_vx = 745,
+    rv_op_vslideup_vi = 746,
+    rv_op_vslide1up_vx = 747,
+    rv_op_vslidedown_vx = 748,
+    rv_op_vslidedown_vi = 749,
+    rv_op_vslide1down_vx = 750,
+    rv_op_vrgather_vv = 751,
+    rv_op_vrgatherei16_vv = 752,
+    rv_op_vrgather_vx = 753,
+    rv_op_vrgather_vi = 754,
+    rv_op_vcompress_vm = 755,
+    rv_op_vmv1r_v = 756,
+    rv_op_vmv2r_v = 757,
+    rv_op_vmv4r_v = 758,
+    rv_op_vmv8r_v = 759,
+    rv_op_vzext_vf2 = 760,
+    rv_op_vzext_vf4 = 761,
+    rv_op_vzext_vf8 = 762,
+    rv_op_vsext_vf2 = 763,
+    rv_op_vsext_vf4 = 764,
+    rv_op_vsext_vf8 = 765,
+    rv_op_vsetvli = 766,
+    rv_op_vsetivli = 767,
+    rv_op_vsetvl = 768,
 } rv_op;
 
 /* structures */
@@ -581,6 +956,8 @@ typedef struct {
     uint8_t   rl;
     uint8_t   bs;
     uint8_t   rnum;
+    uint8_t   vm;
+    uint32_t  vzimm;
 } rv_decode;
 
 typedef struct {
@@ -619,6 +996,13 @@ static const char rv_freg_name_sym[32][5] = {
     "fs8",  "fs9",  "fs10", "fs11", "ft8",  "ft9",  "ft10", "ft11",
 };
 
+static const char rv_vreg_name_sym[32][4] = {
+    "v0",  "v1",  "v2",  "v3",  "v4",  "v5",  "v6",  "v7",
+    "v8",  "v9",  "v10", "v11", "v12", "v13", "v14", "v15",
+    "v16", "v17", "v18", "v19", "v20", "v21", "v22", "v23",
+    "v24", "v25", "v26", "v27", "v28", "v29", "v30", "v31"
+};
+
 /* instruction formats */
 
 #define rv_fmt_none                   "O\t"
@@ -658,6 +1042,34 @@ static const char rv_freg_name_sym[32][5] = {
 #define rv_fmt_rs2_offset             "O\t2,o"
 #define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
 #define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
+#define rv_fmt_ldst_vd_rs1_vm         "O\tD,(1)m"
+#define rv_fmt_ldst_vd_rs1_rs2_vm     "O\tD,(1),2m"
+#define rv_fmt_ldst_vd_rs1_vs2_vm     "O\tD,(1),Fm"
+#define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
+#define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
+#define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
+#define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
+#define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
+#define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"
+#define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
+#define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
+#define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
+#define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
+#define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
+#define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
+#define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"
+#define rv_fmt_vd_vs1                 "O\tD,E"
+#define rv_fmt_vd_rs1                 "O\tD,1"
+#define rv_fmt_vd_fs1                 "O\tD,4"
+#define rv_fmt_vd_imm                 "O\tD,i"
+#define rv_fmt_vd_vs2                 "O\tD,F"
+#define rv_fmt_vd_vs2_vm              "O\tD,Fm"
+#define rv_fmt_rd_vs2_vm              "O\t0,Fm"
+#define rv_fmt_rd_vs2                 "O\t0,F"
+#define rv_fmt_fd_vs2                 "O\t3,F"
+#define rv_fmt_vd_vm                  "O\tDm"
+#define rv_fmt_vsetvli                "O\t0,1,v"
+#define rv_fmt_vsetivli               "O\t0,u,v"
 
 /* pseudo-instruction constraints */
 
@@ -1283,7 +1695,377 @@ const rv_opcode_data opcode_data[] = {
     { "unzip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "zip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "xperm4", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
+    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "vle8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle8_v, rv_op_vle8_v, 0 },
+    { "vle16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle16_v, rv_op_vle16_v, 0 },
+    { "vle32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle32_v, rv_op_vle32_v, 0 },
+    { "vle64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle64_v, rv_op_vle64_v, 0 },
+    { "vse8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse8_v, rv_op_vse8_v, 0 },
+    { "vse16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse16_v, rv_op_vse16_v, 0 },
+    { "vse32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse32_v, rv_op_vse32_v, 0 },
+    { "vse64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse64_v, rv_op_vse64_v, 0 },
+    { "vlm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vlm_v, rv_op_vlm_v, 0 },
+    { "vsm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vsm_v, rv_op_vsm_v, 0 },
+    { "vlse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vlse8_v, rv_op_vlse8_v, 0 },
+    { "vlse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vlse16_v, rv_op_vlse16_v, 0 },
+    { "vlse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vlse32_v, rv_op_vlse32_v, 0 },
+    { "vlse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vlse64_v, rv_op_vlse64_v, 0 },
+    { "vsse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vsse8_v, rv_op_vsse8_v, 0 },
+    { "vsse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vsse16_v, rv_op_vsse16_v, 0 },
+    { "vsse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vsse32_v, rv_op_vsse32_v, 0 },
+    { "vsse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vsse64_v, rv_op_vsse64_v, 0 },
+    { "vluxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vluxei8_v, rv_op_vluxei8_v, 0 },
+    { "vluxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vluxei16_v, rv_op_vluxei16_v, 0 },
+    { "vluxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vluxei32_v, rv_op_vluxei32_v, 0 },
+    { "vluxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vluxei64_v, rv_op_vluxei64_v, 0 },
+    { "vloxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vloxei8_v, rv_op_vloxei8_v, 0 },
+    { "vloxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vloxei16_v, rv_op_vloxei16_v, 0 },
+    { "vloxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vloxei32_v, rv_op_vloxei32_v, 0 },
+    { "vloxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vloxei64_v, rv_op_vloxei64_v, 0 },
+    { "vsuxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsuxei8_v, rv_op_vsuxei8_v, 0 },
+    { "vsuxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsuxei16_v, rv_op_vsuxei16_v, 0 },
+    { "vsuxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsuxei32_v, rv_op_vsuxei32_v, 0 },
+    { "vsuxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsuxei64_v, rv_op_vsuxei64_v, 0 },
+    { "vsoxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsoxei8_v, rv_op_vsoxei8_v, 0 },
+    { "vsoxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsoxei16_v, rv_op_vsoxei16_v, 0 },
+    { "vsoxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsoxei32_v, rv_op_vsoxei32_v, 0 },
+    { "vsoxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_vsoxei64_v, rv_op_vsoxei64_v, 0 },
+    { "vle8ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle8ff_v, rv_op_vle8ff_v, 0 },
+    { "vle16ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle16ff_v, rv_op_vle16ff_v, 0 },
+    { "vle32ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle32ff_v, rv_op_vle32ff_v, 0 },
+    { "vle64ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle64ff_v, rv_op_vle64ff_v, 0 },
+    { "vl1re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl1re8_v, rv_op_vl1re8_v, 0 },
+    { "vl1re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl1re16_v, rv_op_vl1re16_v, 0 },
+    { "vl1re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl1re32_v, rv_op_vl1re32_v, 0 },
+    { "vl1re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl1re64_v, rv_op_vl1re64_v, 0 },
+    { "vl2re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl2re8_v, rv_op_vl2re8_v, 0 },
+    { "vl2re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl2re16_v, rv_op_vl2re16_v, 0 },
+    { "vl2re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl2re32_v, rv_op_vl2re32_v, 0 },
+    { "vl2re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl2re64_v, rv_op_vl2re64_v, 0 },
+    { "vl4re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl4re8_v, rv_op_vl4re8_v, 0 },
+    { "vl4re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl4re16_v, rv_op_vl4re16_v, 0 },
+    { "vl4re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl4re32_v, rv_op_vl4re32_v, 0 },
+    { "vl4re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl4re64_v, rv_op_vl4re64_v, 0 },
+    { "vl8re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl8re8_v, rv_op_vl8re8_v, 0 },
+    { "vl8re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl8re16_v, rv_op_vl8re16_v, 0 },
+    { "vl8re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl8re32_v, rv_op_vl8re32_v, 0 },
+    { "vl8re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl8re64_v, rv_op_vl8re64_v, 0 },
+    { "vs1r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs1r_v, rv_op_vs1r_v, 0 },
+    { "vs2r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs2r_v, rv_op_vs2r_v, 0 },
+    { "vs4r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs4r_v, rv_op_vs4r_v, 0 },
+    { "vs8r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs8r_v, rv_op_vs8r_v, 0 },
+    { "vadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vadd_vv, rv_op_vadd_vv, 0 },
+    { "vadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vadd_vx, rv_op_vadd_vx, 0 },
+    { "vadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vadd_vi, rv_op_vadd_vi, 0 },
+    { "vsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsub_vv, rv_op_vsub_vv, 0 },
+    { "vsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsub_vx, rv_op_vsub_vx, 0 },
+    { "vrsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrsub_vx, rv_op_vrsub_vx, 0 },
+    { "vrsub.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vrsub_vi, rv_op_vrsub_vi, 0 },
+    { "vwaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwaddu_vv, rv_op_vwaddu_vv, 0 },
+    { "vwaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwaddu_vx, rv_op_vwaddu_vx, 0 },
+    { "vwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd_vv, rv_op_vwadd_vv, 0 },
+    { "vwadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd_vx, rv_op_vwadd_vx, 0 },
+    { "vwsubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsubu_vv, rv_op_vwsubu_vv, 0 },
+    { "vwsubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsubu_vx, rv_op_vwsubu_vx, 0 },
+    { "vwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub_vv, rv_op_vwsub_vv, 0 },
+    { "vwsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub_vx, rv_op_vwsub_vx, 0 },
+    { "vwaddu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwaddu_wv, rv_op_vwaddu_wv, 0 },
+    { "vwaddu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwaddu_wx, rv_op_vwaddu_wx, 0 },
+    { "vwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd_wv, rv_op_vwadd_wv, 0 },
+    { "vwadd.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd_wx, rv_op_vwadd_wx, 0 },
+    { "vwsubu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsubu_wv, rv_op_vwsubu_wv, 0 },
+    { "vwsubu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsubu_wx, rv_op_vwsubu_wx, 0 },
+    { "vwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub_wv, rv_op_vwsub_wv, 0 },
+    { "vwsub.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub_wx, rv_op_vwsub_wx, 0 },
+    { "vadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vadc_vvm, rv_op_vadc_vvm, 0 },
+    { "vadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vadc_vxm, rv_op_vadc_vxm, 0 },
+    { "vadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vadc_vim, rv_op_vadc_vim, 0 },
+    { "vmadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmadc_vvm, rv_op_vmadc_vvm, 0 },
+    { "vmadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmadc_vxm, rv_op_vmadc_vxm, 0 },
+    { "vmadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vmadc_vim, rv_op_vmadc_vim, 0 },
+    { "vsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vsbc_vvm, rv_op_vsbc_vvm, 0 },
+    { "vsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vsbc_vxm, rv_op_vsbc_vxm, 0 },
+    { "vmsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmsbc_vvm, rv_op_vmsbc_vvm, 0 },
+    { "vmsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmsbc_vxm, rv_op_vmsbc_vxm, 0 },
+    { "vand.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vand_vv, rv_op_vand_vv, 0 },
+    { "vand.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vand_vx, rv_op_vand_vx, 0 },
+    { "vand.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vand_vi, rv_op_vand_vi, 0 },
+    { "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vor_vv, rv_op_vor_vv, 0 },
+    { "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vor_vx, rv_op_vor_vx, 0 },
+    { "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vor_vi, rv_op_vor_vi, 0 },
+    { "vxor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vxor_vv, rv_op_vxor_vv, 0 },
+    { "vxor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vxor_vx, rv_op_vxor_vx, 0 },
+    { "vxor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vxor_vi, rv_op_vxor_vi, 0 },
+    { "vsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsll_vv, rv_op_vsll_vv, 0 },
+    { "vsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsll_vx, rv_op_vsll_vx, 0 },
+    { "vsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsll_vi, rv_op_vsll_vi, 0 },
+    { "vsrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsrl_vv, rv_op_vsrl_vv, 0 },
+    { "vsrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsrl_vx, rv_op_vsrl_vx, 0 },
+    { "vsrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsrl_vi, rv_op_vsrl_vi, 0 },
+    { "vsra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsra_vv, rv_op_vsra_vv, 0 },
+    { "vsra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsra_vx, rv_op_vsra_vx, 0 },
+    { "vsra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsra_vi, rv_op_vsra_vi, 0 },
+    { "vnsrl.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnsrl_wv, rv_op_vnsrl_wv, 0 },
+    { "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnsrl_wx, rv_op_vnsrl_wx, 0 },
+    { "vnsrl.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnsrl_wi, rv_op_vnsrl_wi, 0 },
+    { "vnsra.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnsra_wv, rv_op_vnsra_wv, 0 },
+    { "vnsra.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnsra_wx, rv_op_vnsra_wx, 0 },
+    { "vnsra.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnsra_wi, rv_op_vnsra_wi, 0 },
+    { "vmseq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmseq_vv, rv_op_vmseq_vv, 0 },
+    { "vmseq.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmseq_vx, rv_op_vmseq_vx, 0 },
+    { "vmseq.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmseq_vi, rv_op_vmseq_vi, 0 },
+    { "vmsne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsne_vv, rv_op_vmsne_vv, 0 },
+    { "vmsne.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsne_vx, rv_op_vmsne_vx, 0 },
+    { "vmsne.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsne_vi, rv_op_vmsne_vi, 0 },
+    { "vmsltu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsltu_vv, rv_op_vmsltu_vv, 0 },
+    { "vmsltu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsltu_vx, rv_op_vmsltu_vx, 0 },
+    { "vmslt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmslt_vv, rv_op_vmslt_vv, 0 },
+    { "vmslt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmslt_vx, rv_op_vmslt_vx, 0 },
+    { "vmsleu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsleu_vv, rv_op_vmsleu_vv, 0 },
+    { "vmsleu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsleu_vx, rv_op_vmsleu_vx, 0 },
+    { "vmsleu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsleu_vi, rv_op_vmsleu_vi, 0 },
+    { "vmsle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsle_vv, rv_op_vmsle_vv, 0 },
+    { "vmsle.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsle_vx, rv_op_vmsle_vx, 0 },
+    { "vmsle.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsle_vi, rv_op_vmsle_vi, 0 },
+    { "vmsgtu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsgtu_vx, rv_op_vmsgtu_vx, 0 },
+    { "vmsgtu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsgtu_vi, rv_op_vmsgtu_vi, 0 },
+    { "vmsgt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsgt_vx, rv_op_vmsgt_vx, 0 },
+    { "vmsgt.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsgt_vi, rv_op_vmsgt_vi, 0 },
+    { "vminu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vminu_vv, rv_op_vminu_vv, 0 },
+    { "vminu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vminu_vx, rv_op_vminu_vx, 0 },
+    { "vmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmin_vv, rv_op_vmin_vv, 0 },
+    { "vmin.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmin_vx, rv_op_vmin_vx, 0 },
+    { "vmaxu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmaxu_vv, rv_op_vmaxu_vv, 0 },
+    { "vmaxu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmaxu_vx, rv_op_vmaxu_vx, 0 },
+    { "vmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmax_vv, rv_op_vmax_vv, 0 },
+    { "vmax.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmax_vx, rv_op_vmax_vx, 0 },
+    { "vmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmul_vv, rv_op_vmul_vv, 0 },
+    { "vmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmul_vx, rv_op_vmul_vx, 0 },
+    { "vmulh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmulh_vv, rv_op_vmulh_vv, 0 },
+    { "vmulh.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmulh_vx, rv_op_vmulh_vx, 0 },
+    { "vmulhu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmulhu_vv, rv_op_vmulhu_vv, 0 },
+    { "vmulhu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmulhu_vx, rv_op_vmulhu_vx, 0 },
+    { "vmulhsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmulhsu_vv, rv_op_vmulhsu_vv, 0 },
+    { "vmulhsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmulhsu_vx, rv_op_vmulhsu_vx, 0 },
+    { "vdivu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vdivu_vv, rv_op_vdivu_vv, 0 },
+    { "vdivu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vdivu_vx, rv_op_vdivu_vx, 0 },
+    { "vdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vdiv_vv, rv_op_vdiv_vv, 0 },
+    { "vdiv.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vdiv_vx, rv_op_vdiv_vx, 0 },
+    { "vremu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vremu_vv, rv_op_vremu_vv, 0 },
+    { "vremu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vremu_vx, rv_op_vremu_vx, 0 },
+    { "vrem.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vrem_vv, rv_op_vrem_vv, 0 },
+    { "vrem.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrem_vx, rv_op_vrem_vx, 0 },
+    { "vwmulu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmulu_vv, rv_op_vwmulu_vv, 0 },
+    { "vwmulu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmulu_vx, rv_op_vwmulu_vx, 0 },
+    { "vwmulsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmulsu_vv, rv_op_vwmulsu_vv, 0 },
+    { "vwmulsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmulsu_vx, rv_op_vwmulsu_vx, 0 },
+    { "vwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmul_vv, rv_op_vwmul_vv, 0 },
+    { "vwmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmul_vx, rv_op_vwmul_vx, 0 },
+    { "vmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vmacc_vv, rv_op_vmacc_vv, 0 },
+    { "vmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vmacc_vx, rv_op_vmacc_vx, 0 },
+    { "vnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vnmsac_vv, rv_op_vnmsac_vv, 0 },
+    { "vnmsac.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vnmsac_vx, rv_op_vnmsac_vx, 0 },
+    { "vmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vmadd_vv, rv_op_vmadd_vv, 0 },
+    { "vmadd.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vmadd_vx, rv_op_vmadd_vx, 0 },
+    { "vnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vnmsub_vv, rv_op_vnmsub_vv, 0 },
+    { "vnmsub.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vnmsub_vx, rv_op_vnmsub_vx, 0 },
+    { "vwmaccu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwmaccu_vv, rv_op_vwmaccu_vv, 0 },
+    { "vwmaccu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwmaccu_vx, rv_op_vwmaccu_vx, 0 },
+    { "vwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwmacc_vv, rv_op_vwmacc_vv, 0 },
+    { "vwmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwmacc_vx, rv_op_vwmacc_vx, 0 },
+    { "vwmaccsu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwmaccsu_vv, rv_op_vwmaccsu_vv, 0 },
+    { "vwmaccsu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwmaccsu_vx, rv_op_vwmaccsu_vx, 0 },
+    { "vwmaccus.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwmaccus_vx, rv_op_vwmaccus_vx, 0 },
+    { "vmv.v.v", rv_codec_v_r, rv_fmt_vd_vs1, NULL, rv_op_vmv_v_v, rv_op_vmv_v_v, 0 },
+    { "vmv.v.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, rv_op_vmv_v_x, rv_op_vmv_v_x, 0 },
+    { "vmv.v.i", rv_codec_v_i, rv_fmt_vd_imm, NULL, rv_op_vmv_v_i, rv_op_vmv_v_i, 0 },
+    { "vmerge.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmerge_vvm, rv_op_vmerge_vvm, 0 },
+    { "vmerge.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmerge_vxm, rv_op_vmerge_vxm, 0 },
+    { "vmerge.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vmerge_vim, rv_op_vmerge_vim, 0 },
+    { "vsaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsaddu_vv, rv_op_vsaddu_vv, 0 },
+    { "vsaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsaddu_vx, rv_op_vsaddu_vx, 0 },
+    { "vsaddu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vsaddu_vi, rv_op_vsaddu_vi, 0 },
+    { "vsadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsadd_vv, rv_op_vsadd_vv, 0 },
+    { "vsadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsadd_vx, rv_op_vsadd_vx, 0 },
+    { "vsadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vsadd_vi, rv_op_vsadd_vi, 0 },
+    { "vssubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssubu_vv, rv_op_vssubu_vv, 0 },
+    { "vssubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssubu_vx, rv_op_vssubu_vx, 0 },
+    { "vssub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssub_vv, rv_op_vssub_vv, 0 },
+    { "vssub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssub_vx, rv_op_vssub_vx, 0 },
+    { "vaadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vaadd_vv, rv_op_vaadd_vv, 0 },
+    { "vaadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vaadd_vx, rv_op_vaadd_vx, 0 },
+    { "vaaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vaaddu_vv, rv_op_vaaddu_vv, 0 },
+    { "vaaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vaaddu_vx, rv_op_vaaddu_vx, 0 },
+    { "vasub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vasub_vv, rv_op_vasub_vv, 0 },
+    { "vasub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vasub_vx, rv_op_vasub_vx, 0 },
+    { "vasubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vasubu_vv, rv_op_vasubu_vv, 0 },
+    { "vasubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vasubu_vx, rv_op_vasubu_vx, 0 },
+    { "vsmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsmul_vv, rv_op_vsmul_vv, 0 },
+    { "vsmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsmul_vx, rv_op_vsmul_vx, 0 },
+    { "vssrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssrl_vv, rv_op_vssrl_vv, 0 },
+    { "vssrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssrl_vx, rv_op_vssrl_vx, 0 },
+    { "vssrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vssrl_vi, rv_op_vssrl_vi, 0 },
+    { "vssra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssra_vv, rv_op_vssra_vv, 0 },
+    { "vssra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssra_vx, rv_op_vssra_vx, 0 },
+    { "vssra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vssra_vi, rv_op_vssra_vi, 0 },
+    { "vnclipu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnclipu_wv, rv_op_vnclipu_wv, 0 },
+    { "vnclipu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnclipu_wx, rv_op_vnclipu_wx, 0 },
+    { "vnclipu.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnclipu_wi, rv_op_vnclipu_wi, 0 },
+    { "vnclip.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnclip_wv, rv_op_vnclip_wv, 0 },
+    { "vnclip.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnclip_wx, rv_op_vnclip_wx, 0 },
+    { "vnclip.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnclip_wi, rv_op_vnclip_wi, 0 },
+    { "vfadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfadd_vv, rv_op_vfadd_vv, 0 },
+    { "vfadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfadd_vf, rv_op_vfadd_vf, 0 },
+    { "vfsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsub_vv, rv_op_vfsub_vv, 0 },
+    { "vfsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsub_vf, rv_op_vfsub_vf, 0 },
+    { "vfrsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfrsub_vf, rv_op_vfrsub_vf, 0 },
+    { "vfwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwadd_vv, rv_op_vfwadd_vv, 0 },
+    { "vfwadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwadd_vf, rv_op_vfwadd_vf, 0 },
+    { "vfwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwadd_wv, rv_op_vfwadd_wv, 0 },
+    { "vfwadd.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwadd_wf, rv_op_vfwadd_wf, 0 },
+    { "vfwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwsub_vv, rv_op_vfwsub_vv, 0 },
+    { "vfwsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwsub_vf, rv_op_vfwsub_vf, 0 },
+    { "vfwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwsub_wv, rv_op_vfwsub_wv, 0 },
+    { "vfwsub.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwsub_wf, rv_op_vfwsub_wf, 0 },
+    { "vfmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmul_vv, rv_op_vfmul_vv, 0 },
+    { "vfmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmul_vf, rv_op_vfmul_vf, 0 },
+    { "vfdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfdiv_vv, rv_op_vfdiv_vv, 0 },
+    { "vfdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfdiv_vf, rv_op_vfdiv_vf, 0 },
+    { "vfrdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfrdiv_vf, rv_op_vfrdiv_vf, 0 },
+    { "vfwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwmul_vv, rv_op_vfwmul_vv, 0 },
+    { "vfwmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwmul_vf, rv_op_vfwmul_vf, 0 },
+    { "vfmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmacc_vv, rv_op_vfmacc_vv, 0 },
+    { "vfmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmacc_vf, rv_op_vfmacc_vf, 0 },
+    { "vfnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnmacc_vv, rv_op_vfnmacc_vv, 0 },
+    { "vfnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnmacc_vf, rv_op_vfnmacc_vf, 0 },
+    { "vfmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmsac_vv, rv_op_vfmsac_vv, 0 },
+    { "vfmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmsac_vf, rv_op_vfmsac_vf, 0 },
+    { "vfnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnmsac_vv, rv_op_vfnmsac_vv, 0 },
+    { "vfnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnmsac_vf, rv_op_vfnmsac_vf, 0 },
+    { "vfmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmadd_vv, rv_op_vfmadd_vv, 0 },
+    { "vfmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmadd_vf, rv_op_vfmadd_vf, 0 },
+    { "vfnmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnmadd_vv, rv_op_vfnmadd_vv, 0 },
+    { "vfnmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnmadd_vf, rv_op_vfnmadd_vf, 0 },
+    { "vfmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmsub_vv, rv_op_vfmsub_vv, 0 },
+    { "vfmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmsub_vf, rv_op_vfmsub_vf, 0 },
+    { "vfnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnmsub_vv, rv_op_vfnmsub_vv, 0 },
+    { "vfnmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnmsub_vf, rv_op_vfnmsub_vf, 0 },
+    { "vfwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwmacc_vv, rv_op_vfwmacc_vv, 0 },
+    { "vfwmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwmacc_vf, rv_op_vfwmacc_vf, 0 },
+    { "vfwnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwnmacc_vv, rv_op_vfwnmacc_vv, 0 },
+    { "vfwnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwnmacc_vf, rv_op_vfwnmacc_vf, 0 },
+    { "vfwmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwmsac_vv, rv_op_vfwmsac_vv, 0 },
+    { "vfwmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwmsac_vf, rv_op_vfwmsac_vf, 0 },
+    { "vfwnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwnmsac_vv, rv_op_vfwnmsac_vv, 0 },
+    { "vfwnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwnmsac_vf, rv_op_vfwnmsac_vf, 0 },
+    { "vfsqrt.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfsqrt_v, rv_op_vfsqrt_v, 0 },
+    { "vfrsqrt7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfrsqrt7_v, rv_op_vfrsqrt7_v, 0 },
+    { "vfrec7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfrec7_v, rv_op_vfrec7_v, 0 },
+    { "vfmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmin_vv, rv_op_vfmin_vv, 0 },
+    { "vfmin.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmin_vf, rv_op_vfmin_vf, 0 },
+    { "vfmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmax_vv, rv_op_vfmax_vv, 0 },
+    { "vfmax.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmax_vf, rv_op_vfmax_vf, 0 },
+    { "vfsgnj.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsgnj_vv, rv_op_vfsgnj_vv, 0 },
+    { "vfsgnj.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsgnj_vf, rv_op_vfsgnj_vf, 0 },
+    { "vfsgnjn.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsgnjn_vv, rv_op_vfsgnjn_vv, 0 },
+    { "vfsgnjn.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsgnjn_vf, rv_op_vfsgnjn_vf, 0 },
+    { "vfsgnjx.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsgnjx_vv, rv_op_vfsgnjx_vv, 0 },
+    { "vfsgnjx.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsgnjx_vf, rv_op_vfsgnjx_vf, 0 },
+    { "vfslide1up.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfslide1up_vf, rv_op_vfslide1up_vf, 0 },
+    { "vfslide1down.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfslide1down_vf, rv_op_vfslide1down_vf, 0 },
+    { "vmfeq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfeq_vv, rv_op_vmfeq_vv, 0 },
+    { "vmfeq.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfeq_vf, rv_op_vmfeq_vf, 0 },
+    { "vmfne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfne_vv, rv_op_vmfne_vv, 0 },
+    { "vmfne.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfne_vf, rv_op_vmfne_vf, 0 },
+    { "vmflt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmflt_vv, rv_op_vmflt_vv, 0 },
+    { "vmflt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmflt_vf, rv_op_vmflt_vf, 0 },
+    { "vmfle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfle_vv, rv_op_vmfle_vv, 0 },
+    { "vmfle.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfle_vf, rv_op_vmfle_vf, 0 },
+    { "vmfgt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfgt_vf, rv_op_vmfgt_vf, 0 },
+    { "vmfge.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfge_vf, rv_op_vmfge_vf, 0 },
+    { "vfclass.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfclass_v, rv_op_vfclass_v, 0 },
+    { "vfmerge.vfm", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vl, NULL, rv_op_vfmerge_vfm, rv_op_vfmerge_vfm, 0 },
+    { "vfmv.v.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, rv_op_vfmv_v_f, rv_op_vfmv_v_f, 0 },
+    { "vfcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_xu_f_v, rv_op_vfcvt_xu_f_v, 0 },
+    { "vfcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_x_f_v, rv_op_vfcvt_x_f_v, 0 },
+    { "vfcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_f_xu_v, rv_op_vfcvt_f_xu_v, 0 },
+    { "vfcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_f_x_v, rv_op_vfcvt_f_x_v, 0 },
+    { "vfcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_rtz_xu_f_v, rv_op_vfcvt_rtz_xu_f_v, 0 },
+    { "vfcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_rtz_x_f_v, rv_op_vfcvt_rtz_x_f_v, 0 },
+    { "vfwcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt_xu_f_v, rv_op_vfwcvt_xu_f_v, 0 },
+    { "vfwcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt_x_f_v, rv_op_vfwcvt_x_f_v, 0 },
+    { "vfwcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt_f_xu_v, rv_op_vfwcvt_f_xu_v, 0 },
+    { "vfwcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt_f_x_v, rv_op_vfwcvt_f_x_v, 0 },
+    { "vfwcvt.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt_f_f_v, rv_op_vfwcvt_f_f_v, 0 },
+    { "vfwcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt_rtz_xu_f_v, rv_op_vfwcvt_rtz_xu_f_v, 0 },
+    { "vfwcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt_rtz_x_f_v, rv_op_vfwcvt_rtz_x_f_v, 0 },
+    { "vfncvt.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_xu_f_w, rv_op_vfncvt_xu_f_w, 0 },
+    { "vfncvt.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_x_f_w, rv_op_vfncvt_x_f_w, 0 },
+    { "vfncvt.f.xu.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_f_xu_w, rv_op_vfncvt_f_xu_w, 0 },
+    { "vfncvt.f.x.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_f_x_w, rv_op_vfncvt_f_x_w, 0 },
+    { "vfncvt.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_f_f_w, rv_op_vfncvt_f_f_w, 0 },
+    { "vfncvt.rod.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_rod_f_f_w, rv_op_vfncvt_rod_f_f_w, 0 },
+    { "vfncvt.rtz.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_rtz_xu_f_w, rv_op_vfncvt_rtz_xu_f_w, 0 },
+    { "vfncvt.rtz.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt_rtz_x_f_w, rv_op_vfncvt_rtz_x_f_w, 0 },
+    { "vredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredsum_vs, rv_op_vredsum_vs, 0 },
+    { "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredand_vs, rv_op_vredand_vs, 0 },
+    { "vredor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredor_vs, rv_op_vredor_vs, 0 },
+    { "vredxor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredxor_vs, rv_op_vredxor_vs, 0 },
+    { "vredminu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredminu_vs, rv_op_vredminu_vs, 0 },
+    { "vredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredmin_vs, rv_op_vredmin_vs, 0 },
+    { "vredmaxu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredmaxu_vs, rv_op_vredmaxu_vs, 0 },
+    { "vredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredmax_vs, rv_op_vredmax_vs, 0 },
+    { "vwredsumu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwredsumu_vs, rv_op_vwredsumu_vs, 0 },
+    { "vwredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwredsum_vs, rv_op_vwredsum_vs, 0 },
+    { "vfredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfredusum_vs, rv_op_vfredusum_vs, 0 },
+    { "vfredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfredosum_vs, rv_op_vfredosum_vs, 0 },
+    { "vfredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfredmin_vs, rv_op_vfredmin_vs, 0 },
+    { "vfredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfredmax_vs, rv_op_vfredmax_vs, 0 },
+    { "vfwredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwredusum_vs, rv_op_vfwredusum_vs, 0 },
+    { "vfwredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwredosum_vs, rv_op_vfwredosum_vs, 0 },
+    { "vmand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmand_mm, rv_op_vmand_mm, 0 },
+    { "vmnand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmnand_mm, rv_op_vmnand_mm, 0 },
+    { "vmandn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmandn_mm, rv_op_vmandn_mm, 0 },
+    { "vmxor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmxor_mm, rv_op_vmxor_mm, 0 },
+    { "vmor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmor_mm, rv_op_vmor_mm, 0 },
+    { "vmnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmnor_mm, rv_op_vmnor_mm, 0 },
+    { "vmorn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmorn_mm, rv_op_vmorn_mm, 0 },
+    { "vmxnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmxnor_mm, rv_op_vmxnor_mm, 0 },
+    { "vcpop.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, rv_op_vcpop_m, rv_op_vcpop_m, 0 },
+    { "vfirst.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, rv_op_vfirst_m, rv_op_vfirst_m, 0 },
+    { "vmsbf.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsbf_m, rv_op_vmsbf_m, 0 },
+    { "vmsif.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsif_m, rv_op_vmsif_m, 0 },
+    { "vmsof.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsof_m, rv_op_vmsof_m, 0 },
+    { "viota.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_viota_m, rv_op_viota_m, 0 },
+    { "vid.v", rv_codec_v_r, rv_fmt_vd_vm, NULL, rv_op_vid_v, rv_op_vid_v, 0 },
+    { "vmv.x.s", rv_codec_v_r, rv_fmt_rd_vs2, NULL, rv_op_vmv_x_s, rv_op_vmv_x_s, 0 },
+    { "vmv.s.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, rv_op_vmv_s_x, rv_op_vmv_s_x, 0 },
+    { "vfmv.f.s", rv_codec_v_r, rv_fmt_fd_vs2, NULL, rv_op_vfmv_f_s, rv_op_vfmv_f_s, 0 },
+    { "vfmv.s.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, rv_op_vfmv_s_f, rv_op_vfmv_s_f, 0 },
+    { "vslideup.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vslideup_vx, rv_op_vslideup_vx, 0 },
+    { "vslideup.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vslideup_vi, rv_op_vslideup_vi, 0 },
+    { "vslide1up.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vslide1up_vx, rv_op_vslide1up_vx, 0 },
+    { "vslidedown.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vslidedown_vx, rv_op_vslidedown_vx, 0 },
+    { "vslidedown.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vslidedown_vi, rv_op_vslidedown_vi, 0 },
+    { "vslide1down.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vslide1down_vx, rv_op_vslide1down_vx, 0 },
+    { "vrgather.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vrgather_vv, rv_op_vrgather_vv, 0 },
+    { "vrgatherei16.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vrgatherei16_vv, rv_op_vrgatherei16_vv, 0 },
+    { "vrgather.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrgather_vx, rv_op_vrgather_vx, 0 },
+    { "vrgather.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vrgather_vi, rv_op_vrgather_vi, 0 },
+    { "vcompress.vm", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, rv_op_vcompress_vm, rv_op_vcompress_vm, 0 },
+    { "vmv1r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv1r_v, rv_op_vmv1r_v, 0 },
+    { "vmv2r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv2r_v, rv_op_vmv2r_v, 0 },
+    { "vmv4r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv4r_v, rv_op_vmv4r_v, 0 },
+    { "vmv8r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv8r_v, rv_op_vmv8r_v, 0 },
+    { "vzext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf2, rv_op_vzext_vf2, 0 },
+    { "vzext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf4, rv_op_vzext_vf4, 0 },
+    { "vzext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf8, rv_op_vzext_vf8, 0 },
+    { "vsext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf2, rv_op_vsext_vf2, 0 },
+    { "vsext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf4, rv_op_vsext_vf4, 0 },
+    { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
+    { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
+    { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
 };
 
 /* CSR names */
@@ -1297,6 +2079,10 @@ static const char *csr_name(int csrno)
     case 0x0003: return "fcsr";
     case 0x0004: return "uie";
     case 0x0005: return "utvec";
+    case 0x0008: return "vstart";
+    case 0x0009: return "vxsat";
+    case 0x000a: return "vxrm";
+    case 0x000f: return "vcsr";
     case 0x0015: return "seed";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
@@ -1471,6 +2257,9 @@ static const char *csr_name(int csrno)
     case 0x0c00: return "cycle";
     case 0x0c01: return "time";
     case 0x0c02: return "instret";
+    case 0x0c20: return "vl";
+    case 0x0c21: return "vtype";
+    case 0x0c22: return "vlenb";
     case 0x0c80: return "cycleh";
     case 0x0c81: return "timeh";
     case 0x0c82: return "instreth";
@@ -1658,9 +2447,86 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             break;
         case 1:
             switch (((inst >> 12) & 0b111)) {
+            case 0:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op = rv_op_vl1re8_v; break;
+                case 552: op = rv_op_vl2re8_v; break;
+                case 1576: op = rv_op_vl4re8_v; break;
+                case 3624: op = rv_op_vl8re8_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vle8_v; break;
+                    case 11: op = rv_op_vlm_v; break;
+                    case 16: op = rv_op_vle8ff_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vluxei8_v; break;
+                case 2: op = rv_op_vlse8_v; break;
+                case 3: op = rv_op_vloxei8_v; break;
+                }
+                break;
             case 2: op = rv_op_flw; break;
             case 3: op = rv_op_fld; break;
             case 4: op = rv_op_flq; break;
+            case 5:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op = rv_op_vl1re16_v; break;
+                case 552: op = rv_op_vl2re16_v; break;
+                case 1576: op = rv_op_vl4re16_v; break;
+                case 3624: op = rv_op_vl8re16_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vle16_v; break;
+                    case 16: op = rv_op_vle16ff_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vluxei16_v; break;
+                case 2: op = rv_op_vlse16_v; break;
+                case 3: op = rv_op_vloxei16_v; break;
+                }
+                break;
+            case 6:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op = rv_op_vl1re32_v; break;
+                case 552: op = rv_op_vl2re32_v; break;
+                case 1576: op = rv_op_vl4re32_v; break;
+                case 3624: op = rv_op_vl8re32_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vle32_v; break;
+                    case 16: op = rv_op_vle32ff_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vluxei32_v; break;
+                case 2: op = rv_op_vlse32_v; break;
+                case 3: op = rv_op_vloxei32_v; break;
+                }
+                break;
+            case 7:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op = rv_op_vl1re64_v; break;
+                case 552: op = rv_op_vl2re64_v; break;
+                case 1576: op = rv_op_vl4re64_v; break;
+                case 3624: op = rv_op_vl8re64_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vle64_v; break;
+                    case 16: op = rv_op_vle64ff_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vluxei64_v; break;
+                case 2: op = rv_op_vlse64_v; break;
+                case 3: op = rv_op_vloxei64_v; break;
+                }
+                break;
             }
             break;
         case 3:
@@ -1785,9 +2651,64 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             break;
         case 9:
             switch (((inst >> 12) & 0b111)) {
+            case 0:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op = rv_op_vs1r_v; break;
+                case 552: op = rv_op_vs2r_v; break;
+                case 1576: op = rv_op_vs4r_v; break;
+                case 3624: op = rv_op_vs8r_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vse8_v; break;
+                    case 11: op = rv_op_vsm_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vsuxei8_v; break;
+                case 2: op = rv_op_vsse8_v; break;
+                case 3: op = rv_op_vsoxei8_v; break;
+                }
+                break;
             case 2: op = rv_op_fsw; break;
             case 3: op = rv_op_fsd; break;
             case 4: op = rv_op_fsq; break;
+            case 5:
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vse16_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vsuxei16_v; break;
+                case 2: op = rv_op_vsse16_v; break;
+                case 3: op = rv_op_vsoxei16_v; break;
+                }
+                break;
+            case 6:
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vse32_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vsuxei32_v; break;
+                case 2: op = rv_op_vsse32_v; break;
+                case 3: op = rv_op_vsoxei32_v; break;
+                }
+                break;
+            case 7:
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op = rv_op_vse64_v; break;
+                    }
+                    break;
+                case 1: op = rv_op_vsuxei64_v; break;
+                case 2: op = rv_op_vsse64_v; break;
+                case 3: op = rv_op_vsoxei64_v; break;
+                }
+                break;
             }
             break;
         case 11:
@@ -2154,6 +3075,408 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 break;
             }
             break;
+        case 21:
+            switch (((inst >> 12) & 0b111)) {
+            case 0:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op = rv_op_vadd_vv; break;
+                case 2: op = rv_op_vsub_vv; break;
+                case 4: op = rv_op_vminu_vv; break;
+                case 5: op = rv_op_vmin_vv; break;
+                case 6: op = rv_op_vmaxu_vv; break;
+                case 7: op = rv_op_vmax_vv; break;
+                case 9: op = rv_op_vand_vv; break;
+                case 10: op = rv_op_vor_vv; break;
+                case 11: op = rv_op_vxor_vv; break;
+                case 12: op = rv_op_vrgather_vv; break;
+                case 14: op = rv_op_vrgatherei16_vv; break;
+                case 16: if (((inst >> 25) & 1) == 0) op = rv_op_vadc_vvm; break;
+                case 17: op = rv_op_vmadc_vvm; break;
+                case 18: if (((inst >> 25) & 1) == 0) op = rv_op_vsbc_vvm; break;
+                case 19: op = rv_op_vmsbc_vvm; break;
+                case 23:
+                    if (((inst >> 20) & 0b111111) == 32)
+                        op = rv_op_vmv_v_v;
+                    else if (((inst >> 25) & 1) == 0)
+                        op = rv_op_vmerge_vvm;
+                    break;
+                case 24: op = rv_op_vmseq_vv; break;
+                case 25: op = rv_op_vmsne_vv; break;
+                case 26: op = rv_op_vmsltu_vv; break;
+                case 27: op = rv_op_vmslt_vv; break;
+                case 28: op = rv_op_vmsleu_vv; break;
+                case 29: op = rv_op_vmsle_vv; break;
+                case 32: op = rv_op_vsaddu_vv; break;
+                case 33: op = rv_op_vsadd_vv; break;
+                case 34: op = rv_op_vssubu_vv; break;
+                case 35: op = rv_op_vssub_vv; break;
+                case 37: op = rv_op_vsll_vv; break;
+                case 39: op = rv_op_vsmul_vv; break;
+                case 40: op = rv_op_vsrl_vv; break;
+                case 41: op = rv_op_vsra_vv; break;
+                case 42: op = rv_op_vssrl_vv; break;
+                case 43: op = rv_op_vssra_vv; break;
+                case 44: op = rv_op_vnsrl_wv; break;
+                case 45: op = rv_op_vnsra_wv; break;
+                case 46: op = rv_op_vnclipu_wv; break;
+                case 47: op = rv_op_vnclip_wv; break;
+                case 48: op = rv_op_vwredsumu_vs; break;
+                case 49: op = rv_op_vwredsum_vs; break;
+                }
+                break;
+            case 1:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op = rv_op_vfadd_vv; break;
+                case 1: op = rv_op_vfredusum_vs; break;
+                case 2: op = rv_op_vfsub_vv; break;
+                case 3: op = rv_op_vfredosum_vs; break;
+                case 4: op = rv_op_vfmin_vv; break;
+                case 5: op = rv_op_vfredmin_vs; break;
+                case 6: op = rv_op_vfmax_vv; break;
+                case 7: op = rv_op_vfredmax_vs; break;
+                case 8: op = rv_op_vfsgnj_vv; break;
+                case 9: op = rv_op_vfsgnjn_vv; break;
+                case 10: op = rv_op_vfsgnjx_vv; break;
+                case 16:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op = rv_op_vfmv_f_s; break;
+                    }
+                    break;
+                case 18:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: op = rv_op_vfcvt_xu_f_v; break;
+                    case 1: op = rv_op_vfcvt_x_f_v; break;
+                    case 2: op = rv_op_vfcvt_f_xu_v; break;
+                    case 3: op = rv_op_vfcvt_f_x_v; break;
+                    case 6: op = rv_op_vfcvt_rtz_xu_f_v; break;
+                    case 7: op = rv_op_vfcvt_rtz_x_f_v; break;
+                    case 8: op = rv_op_vfwcvt_xu_f_v; break;
+                    case 9: op = rv_op_vfwcvt_x_f_v; break;
+                    case 10: op = rv_op_vfwcvt_f_xu_v; break;
+                    case 11: op = rv_op_vfwcvt_f_x_v; break;
+                    case 12: op = rv_op_vfwcvt_f_f_v; break;
+                    case 14: op = rv_op_vfwcvt_rtz_xu_f_v; break;
+                    case 15: op = rv_op_vfwcvt_rtz_x_f_v; break;
+                    case 16: op = rv_op_vfncvt_xu_f_w; break;
+                    case 17: op = rv_op_vfncvt_x_f_w; break;
+                    case 18: op = rv_op_vfncvt_f_xu_w; break;
+                    case 19: op = rv_op_vfncvt_f_x_w; break;
+                    case 20: op = rv_op_vfncvt_f_f_w; break;
+                    case 21: op = rv_op_vfncvt_rod_f_f_w; break;
+                    case 22: op = rv_op_vfncvt_rtz_xu_f_w; break;
+                    case 23: op = rv_op_vfncvt_rtz_x_f_w; break;
+                    }
+                    break;
+                case 19:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: op = rv_op_vfsqrt_v; break;
+                    case 4: op = rv_op_vfrsqrt7_v; break;
+                    case 5: op = rv_op_vfrec7_v; break;
+                    case 16: op = rv_op_vfclass_v; break;
+                    }
+                    break;
+                case 24: op = rv_op_vmfeq_vv; break;
+                case 25: op = rv_op_vmfle_vv; break;
+                case 27: op = rv_op_vmflt_vv; break;
+                case 28: op = rv_op_vmfne_vv; break;
+                case 32: op = rv_op_vfdiv_vv; break;
+                case 36: op = rv_op_vfmul_vv; break;
+                case 40: op = rv_op_vfmadd_vv; break;
+                case 41: op = rv_op_vfnmadd_vv; break;
+                case 42: op = rv_op_vfmsub_vv; break;
+                case 43: op = rv_op_vfnmsub_vv; break;
+                case 44: op = rv_op_vfmacc_vv; break;
+                case 45: op = rv_op_vfnmacc_vv; break;
+                case 46: op = rv_op_vfmsac_vv; break;
+                case 47: op = rv_op_vfnmsac_vv; break;
+                case 48: op = rv_op_vfwadd_vv; break;
+                case 49: op = rv_op_vfwredusum_vs; break;
+                case 50: op = rv_op_vfwsub_vv; break;
+                case 51: op = rv_op_vfwredosum_vs; break;
+                case 52: op = rv_op_vfwadd_wv; break;
+                case 54: op = rv_op_vfwsub_wv; break;
+                case 56: op = rv_op_vfwmul_vv; break;
+                case 60: op = rv_op_vfwmacc_vv; break;
+                case 61: op = rv_op_vfwnmacc_vv; break;
+                case 62: op = rv_op_vfwmsac_vv; break;
+                case 63: op = rv_op_vfwnmsac_vv; break;
+                }
+                break;
+            case 2:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op = rv_op_vredsum_vs; break;
+                case 1: op = rv_op_vredand_vs; break;
+                case 2: op = rv_op_vredor_vs; break;
+                case 3: op = rv_op_vredxor_vs; break;
+                case 4: op = rv_op_vredminu_vs; break;
+                case 5: op = rv_op_vredmin_vs; break;
+                case 6: op = rv_op_vredmaxu_vs; break;
+                case 7: op = rv_op_vredmax_vs; break;
+                case 8: op = rv_op_vaaddu_vv; break;
+                case 9: op = rv_op_vaadd_vv; break;
+                case 10: op = rv_op_vasubu_vv; break;
+                case 11: op = rv_op_vasub_vv; break;
+                case 16:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op = rv_op_vmv_x_s; break;
+                    case 16: op = rv_op_vcpop_m; break;
+                    case 17: op = rv_op_vfirst_m; break;
+                    }
+                    break;
+                case 18:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 2: op = rv_op_vzext_vf8; break;
+                    case 3: op = rv_op_vsext_vf8; break;
+                    case 4: op = rv_op_vzext_vf4; break;
+                    case 5: op = rv_op_vsext_vf4; break;
+                    case 6: op = rv_op_vzext_vf2; break;
+                    case 7: op = rv_op_vsext_vf2; break;
+                    }
+                    break;
+                case 20:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 1: op = rv_op_vmsbf_m;  break;
+                    case 2: op = rv_op_vmsof_m; break;
+                    case 3: op = rv_op_vmsif_m; break;
+                    case 16: op = rv_op_viota_m; break;
+                    case 17: if (((inst >> 20) & 0b11111) == 0) op = rv_op_vid_v; break;
+                    }
+                    break;
+                case 23: if ((inst >> 25) & 1) op = rv_op_vcompress_vm; break;
+                case 24: if ((inst >> 25) & 1) op = rv_op_vmandn_mm; break;
+                case 25: if ((inst >> 25) & 1) op = rv_op_vmand_mm; break;
+                case 26: if ((inst >> 25) & 1) op = rv_op_vmor_mm; break;
+                case 27: if ((inst >> 25) & 1) op = rv_op_vmxor_mm; break;
+                case 28: if ((inst >> 25) & 1) op = rv_op_vmorn_mm; break;
+                case 29: if ((inst >> 25) & 1) op = rv_op_vmnand_mm; break;
+                case 30: if ((inst >> 25) & 1) op = rv_op_vmnor_mm; break;
+                case 31: if ((inst >> 25) & 1) op = rv_op_vmxnor_mm; break;
+                case 32: op = rv_op_vdivu_vv; break;
+                case 33: op = rv_op_vdiv_vv; break;
+                case 34: op = rv_op_vremu_vv; break;
+                case 35: op = rv_op_vrem_vv; break;
+                case 36: op = rv_op_vmulhu_vv; break;
+                case 37: op = rv_op_vmul_vv; break;
+                case 38: op = rv_op_vmulhsu_vv; break;
+                case 39: op = rv_op_vmulh_vv; break;
+                case 41: op = rv_op_vmadd_vv; break;
+                case 43: op = rv_op_vnmsub_vv; break;
+                case 45: op = rv_op_vmacc_vv; break;
+                case 47: op = rv_op_vnmsac_vv; break;
+                case 48: op = rv_op_vwaddu_vv; break;
+                case 49: op = rv_op_vwadd_vv; break;
+                case 50: op = rv_op_vwsubu_vv; break;
+                case 51: op = rv_op_vwsub_vv; break;
+                case 52: op = rv_op_vwaddu_wv; break;
+                case 53: op = rv_op_vwadd_wv; break;
+                case 54: op = rv_op_vwsubu_wv; break;
+                case 55: op = rv_op_vwsub_wv; break;
+                case 56: op = rv_op_vwmulu_vv; break;
+                case 58: op = rv_op_vwmulsu_vv; break;
+                case 59: op = rv_op_vwmul_vv; break;
+                case 60: op = rv_op_vwmaccu_vv; break;
+                case 61: op = rv_op_vwmacc_vv; break;
+                case 63: op = rv_op_vwmaccsu_vv; break;
+                }
+                break;
+            case 3:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op = rv_op_vadd_vi; break;
+                case 3: op = rv_op_vrsub_vi; break;
+                case 9: op = rv_op_vand_vi; break;
+                case 10: op = rv_op_vor_vi; break;
+                case 11: op = rv_op_vxor_vi; break;
+                case 12: op = rv_op_vrgather_vi; break;
+                case 14: op = rv_op_vslideup_vi; break;
+                case 15: op = rv_op_vslidedown_vi; break;
+                case 16: if (((inst >> 25) & 1) == 0) op = rv_op_vadc_vim; break;
+                case 17: op = rv_op_vmadc_vim; break;
+                case 23:
+                    if (((inst >> 20) & 0b111111) == 32)
+                        op = rv_op_vmv_v_i;
+                    else if (((inst >> 25) & 1) == 0)
+                        op = rv_op_vmerge_vim;
+                    break;
+                case 24: op = rv_op_vmseq_vi; break;
+                case 25: op = rv_op_vmsne_vi; break;
+                case 28: op = rv_op_vmsleu_vi; break;
+                case 29: op = rv_op_vmsle_vi; break;
+                case 30: op = rv_op_vmsgtu_vi; break;
+                case 31: op = rv_op_vmsgt_vi; break;
+                case 32: op = rv_op_vsaddu_vi; break;
+                case 33: op = rv_op_vsadd_vi; break;
+                case 37: op = rv_op_vsll_vi; break;
+                case 39:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: op = rv_op_vmv1r_v; break;
+                    case 1: op = rv_op_vmv2r_v; break;
+                    case 3: op = rv_op_vmv4r_v; break;
+                    case 7: op = rv_op_vmv8r_v; break;
+                    }
+                    break;
+                case 40: op = rv_op_vsrl_vi; break;
+                case 41: op = rv_op_vsra_vi; break;
+                case 42: op = rv_op_vssrl_vi; break;
+                case 43: op = rv_op_vssra_vi; break;
+                case 44: op = rv_op_vnsrl_wi; break;
+                case 45: op = rv_op_vnsra_wi; break;
+                case 46: op = rv_op_vnclipu_wi; break;
+                case 47: op = rv_op_vnclip_wi; break;
+                }
+                break;
+            case 4:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op = rv_op_vadd_vx; break;
+                case 2: op = rv_op_vsub_vx; break;
+                case 3: op = rv_op_vrsub_vx; break;
+                case 4: op = rv_op_vminu_vx; break;
+                case 5: op = rv_op_vmin_vx; break;
+                case 6: op = rv_op_vmaxu_vx; break;
+                case 7: op = rv_op_vmax_vx; break;
+                case 9: op = rv_op_vand_vx; break;
+                case 10: op = rv_op_vor_vx; break;
+                case 11: op = rv_op_vxor_vx; break;
+                case 12: op = rv_op_vrgather_vx; break;
+                case 14: op = rv_op_vslideup_vx; break;
+                case 15: op = rv_op_vslidedown_vx; break;
+                case 16: if (((inst >> 25) & 1) == 0) op = rv_op_vadc_vxm; break;
+                case 17: op = rv_op_vmadc_vxm; break;
+                case 18: if (((inst >> 25) & 1) == 0) op = rv_op_vsbc_vxm; break;
+                case 19: op = rv_op_vmsbc_vxm; break;
+                case 23:
+                    if (((inst >> 20) & 0b111111) == 32)
+                        op = rv_op_vmv_v_x;
+                    else if (((inst >> 25) & 1) == 0)
+                        op = rv_op_vmerge_vxm;
+                    break;
+                case 24: op = rv_op_vmseq_vx; break;
+                case 25: op = rv_op_vmsne_vx; break;
+                case 26: op = rv_op_vmsltu_vx; break;
+                case 27: op = rv_op_vmslt_vx; break;
+                case 28: op = rv_op_vmsleu_vx; break;
+                case 29: op = rv_op_vmsle_vx; break;
+                case 30: op = rv_op_vmsgtu_vx; break;
+                case 31: op = rv_op_vmsgt_vx; break;
+                case 32: op = rv_op_vsaddu_vx; break;
+                case 33: op = rv_op_vsadd_vx; break;
+                case 34: op = rv_op_vssubu_vx; break;
+                case 35: op = rv_op_vssub_vx; break;
+                case 37: op = rv_op_vsll_vx; break;
+                case 39: op = rv_op_vsmul_vx; break;
+                case 40: op = rv_op_vsrl_vx; break;
+                case 41: op = rv_op_vsra_vx; break;
+                case 42: op = rv_op_vssrl_vx; break;
+                case 43: op = rv_op_vssra_vx; break;
+                case 44: op = rv_op_vnsrl_wx; break;
+                case 45: op = rv_op_vnsra_wx; break;
+                case 46: op = rv_op_vnclipu_wx; break;
+                case 47: op = rv_op_vnclip_wx; break;
+                }
+                break;
+            case 5:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op = rv_op_vfadd_vf; break;
+                case 2: op = rv_op_vfsub_vf; break;
+                case 4: op = rv_op_vfmin_vf; break;
+                case 6: op = rv_op_vfmax_vf; break;
+                case 8: op = rv_op_vfsgnj_vf; break;
+                case 9: op = rv_op_vfsgnjn_vf; break;
+                case 10: op = rv_op_vfsgnjx_vf; break;
+                case 14: op = rv_op_vfslide1up_vf; break;
+                case 15: op = rv_op_vfslide1down_vf; break;
+                case 16:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op = rv_op_vfmv_s_f; break;
+                    }
+                    break;
+                case 23:
+                    if (((inst >> 25) & 1) == 0)
+                        op = rv_op_vfmerge_vfm;
+                    else if (((inst >> 20) & 0b111111) == 32)
+                        op = rv_op_vfmv_v_f;
+                    break;
+                case 24: op = rv_op_vmfeq_vf; break;
+                case 25: op = rv_op_vmfle_vf; break;
+                case 27: op = rv_op_vmflt_vf; break;
+                case 28: op = rv_op_vmfne_vf; break;
+                case 29: op = rv_op_vmfgt_vf; break;
+                case 31: op = rv_op_vmfge_vf; break;
+                case 32: op = rv_op_vfdiv_vf; break;
+                case 33: op = rv_op_vfrdiv_vf; break;
+                case 36: op = rv_op_vfmul_vf; break;
+                case 39: op = rv_op_vfrsub_vf; break;
+                case 40: op = rv_op_vfmadd_vf; break;
+                case 41: op = rv_op_vfnmadd_vf; break;
+                case 42: op = rv_op_vfmsub_vf; break;
+                case 43: op = rv_op_vfnmsub_vf; break;
+                case 44: op = rv_op_vfmacc_vf; break;
+                case 45: op = rv_op_vfnmacc_vf; break;
+                case 46: op = rv_op_vfmsac_vf; break;
+                case 47: op = rv_op_vfnmsac_vf; break;
+                case 48: op = rv_op_vfwadd_vf; break;
+                case 50: op = rv_op_vfwsub_vf; break;
+                case 52: op = rv_op_vfwadd_wf; break;
+                case 54: op = rv_op_vfwsub_wf; break;
+                case 56: op = rv_op_vfwmul_vf; break;
+                case 60: op = rv_op_vfwmacc_vf; break;
+                case 61: op = rv_op_vfwnmacc_vf; break;
+                case 62: op = rv_op_vfwmsac_vf; break;
+                case 63: op = rv_op_vfwnmsac_vf; break;
+                }
+                break;
+            case 6:
+                switch (((inst >> 26) & 0b111111)) {
+                case 8: op = rv_op_vaaddu_vx; break;
+                case 9: op = rv_op_vaadd_vx; break;
+                case 10: op = rv_op_vasubu_vx; break;
+                case 11: op = rv_op_vasub_vx; break;
+                case 14: op = rv_op_vslide1up_vx; break;
+                case 15: op = rv_op_vslide1down_vx; break;
+                case 16:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op = rv_op_vmv_s_x; break;
+                    }
+                    break;
+                case 32: op = rv_op_vdivu_vx; break;
+                case 33: op = rv_op_vdiv_vx; break;
+                case 34: op = rv_op_vremu_vx; break;
+                case 35: op = rv_op_vrem_vx; break;
+                case 36: op = rv_op_vmulhu_vx; break;
+                case 37: op = rv_op_vmul_vx; break;
+                case 38: op = rv_op_vmulhsu_vx; break;
+                case 39: op = rv_op_vmulh_vx; break;
+                case 41: op = rv_op_vmadd_vx; break;
+                case 43: op = rv_op_vnmsub_vx; break;
+                case 45: op = rv_op_vmacc_vx; break;
+                case 47: op = rv_op_vnmsac_vx; break;
+                case 48: op = rv_op_vwaddu_vx; break;
+                case 49: op = rv_op_vwadd_vx; break;
+                case 50: op = rv_op_vwsubu_vx; break;
+                case 51: op = rv_op_vwsub_vx; break;
+                case 52: op = rv_op_vwaddu_wx; break;
+                case 53: op = rv_op_vwadd_wx; break;
+                case 54: op = rv_op_vwsubu_wx; break;
+                case 55: op = rv_op_vwsub_wx; break;
+                case 56: op = rv_op_vwmulu_vx; break;
+                case 58: op = rv_op_vwmulsu_vx; break;
+                case 59: op = rv_op_vwmul_vx; break;
+                case 60: op = rv_op_vwmaccu_vx; break;
+                case 61: op = rv_op_vwmacc_vx; break;
+                case 62: op = rv_op_vwmaccus_vx; break;
+                case 63: op = rv_op_vwmaccsu_vx; break;
+                }
+                break;
+            case 7:
+                if (((inst >> 31) & 1) == 0) {
+                    op = rv_op_vsetvli;
+                } else if ((inst >> 30) & 1) {
+                    op = rv_op_vsetivli;
+                } else if (((inst >> 25) & 0b11111) == 0) {
+                    op = rv_op_vsetvl;
+                }
+                break;
+            }
+            break;
         case 22:
             switch (((inst >> 12) & 0b111)) {
             case 0: op = rv_op_addid; break;
@@ -2517,6 +3840,21 @@ static uint32_t operand_cimmq(rv_inst inst)
         ((inst << 57) >> 62) << 6;
 }
 
+static uint32_t operand_vimm(rv_inst inst)
+{
+    return (int64_t)(inst << 44) >> 59;
+}
+
+static uint32_t operand_vzimm11(rv_inst inst)
+{
+    return (inst << 33) >> 53;
+}
+
+static uint32_t operand_vzimm10(rv_inst inst)
+{
+    return (inst << 34) >> 54;
+}
+
 static uint32_t operand_bs(rv_inst inst)
 {
     return (inst << 32) >> 62;
@@ -2527,6 +3865,11 @@ static uint32_t operand_rnum(rv_inst inst)
     return (inst << 40) >> 60;
 }
 
+static uint32_t operand_vm(rv_inst inst)
+{
+    return (inst << 38) >> 63;
+}
+
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec)
@@ -2816,6 +4159,31 @@ static void decode_inst_operands(rv_decode *dec)
         dec->rs1 = operand_rs1(inst);
         dec->rnum = operand_rnum(inst);
         break;
+    case rv_codec_v_r:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->rs2 = operand_rs2(inst);
+        dec->vm = operand_vm(inst);
+        break;
+    case rv_codec_v_ldst:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->vm = operand_vm(inst);
+        break;
+    case rv_codec_v_i:
+        dec->rd = operand_rd(inst);
+        dec->rs2 = operand_rs2(inst);
+        dec->imm = operand_vimm(inst);
+        dec->vm = operand_vm(inst);
+        break;
+    case rv_codec_vsetvli:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->vzimm = operand_vzimm11(inst);
+    case rv_codec_vsetivli:
+        dec->rd = operand_rd(inst);
+        dec->imm = operand_vimm(inst);
+        dec->vzimm = operand_vzimm10(inst);
     };
 }
 
@@ -3012,6 +4380,10 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             snprintf(tmp, sizeof(tmp), "%d", dec->imm);
             append(buf, tmp, buflen);
             break;
+        case 'u':
+            snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b11111));
+            append(buf, tmp, buflen);
+            break;
         case 'o':
             snprintf(tmp, sizeof(tmp), "%d", dec->imm);
             append(buf, tmp, buflen);
@@ -3100,6 +4472,60 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
                 append(buf, ".rl", buflen);
             }
             break;
+        case 'l':
+            append(buf, ",v0", buflen);
+            break;
+        case 'm':
+            if (dec->vm == 0) {
+                append(buf, ",v0.t", buflen);
+            }
+            break;
+        case 'D':
+            append(buf, rv_vreg_name_sym[dec->rd], buflen);
+            break;
+        case 'E':
+            append(buf, rv_vreg_name_sym[dec->rs1], buflen);
+            break;
+        case 'F':
+            append(buf, rv_vreg_name_sym[dec->rs2], buflen);
+            break;
+        case 'G':
+            append(buf, rv_vreg_name_sym[dec->rs3], buflen);
+            break;
+        case 'v': {
+            char nbuf[4] = {0};
+            const int sew = 1 << (((dec->vzimm >> 3) & 0b111) + 3);
+            sprintf(nbuf, "%d", sew);
+            const int lmul = dec->vzimm & 0b11;
+            const int flmul = (dec->vzimm >> 2) & 1;
+            const char *vta = (dec->vzimm >> 6) & 1 ? "ta" : "tu";
+            const char *vma = (dec->vzimm >> 7) & 1 ? "ma" : "mu";
+            append(buf, "e", buflen);
+            append(buf, nbuf, buflen);
+            append(buf, ",m", buflen);
+            if (flmul) {
+                switch (lmul) {
+                case 3:
+                    sprintf(nbuf, "f2");
+                    break;
+                case 2:
+                    sprintf(nbuf, "f4");
+                    break;
+                case 1:
+                    sprintf(nbuf, "f8");
+                break;
+                }
+                append(buf, nbuf, buflen);
+            } else {
+                sprintf(nbuf, "%d", 1 << lmul);
+                append(buf, nbuf, buflen);
+            }
+            append(buf, ",", buflen);
+            append(buf, vta, buflen);
+            append(buf, ",", buflen);
+            append(buf, vma, buflen);
+            break;
+        }
         default:
             break;
         }
@@ -3196,7 +4622,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
     decode_inst_operands(&dec);
     decode_inst_decompress(&dec, isa);
     decode_inst_lift_pseudo(&dec);
-    format_inst(buf, buflen, 16, &dec);
+    format_inst(buf, buflen, 24, &dec);
 }
 
 #define INST_FMT_2 "%04" PRIx64 "              "
-- 
2.30.1 (Apple Git-130)


