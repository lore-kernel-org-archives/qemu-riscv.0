Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjwu9-0003zV-FA
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 02:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwtw-0003ym-HN; Wed, 05 Apr 2023 02:45:51 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwtr-0007Kz-B2; Wed, 05 Apr 2023 02:45:47 -0400
Received: by mail-ua1-x92f.google.com with SMTP id i22so24875032uat.8;
 Tue, 04 Apr 2023 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680677141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZfMYrE0uWD1dv4Z5EoXHz8AjWsjMW+CAmrOq+Pcmo4=;
 b=IR4Rai6T1kaiDQUg7fl7muX9tqDAo/YQJJfX+qjKV49ESJeBpvAtSlAElMpjzb6uGt
 8Si3B/Jl8LnNNGGr2arLVMEfozgwwYgFuxzvnDRLbpZU7Kh3+l6ljQ5uB2mEZlWo9WY3
 OZNhkwT85qTbuGqr0cM83GtC9u/+vXpNE4OeM3LYs5OeyZBwL3TMaVtSuFnHujB50VHH
 gr0PKIErj2NXtFzS+J3aLsV//s+BJQzPW+R6U/AWjBTP69vvrptswt+LTs4hyX5cSLUw
 Io6lcxxS6b8ht/ZbEJc/I+10Q+Vxw86CGq8BscT+zCN1ymDRL2e024uiFjJ+tETFErVc
 DiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZfMYrE0uWD1dv4Z5EoXHz8AjWsjMW+CAmrOq+Pcmo4=;
 b=yDq+1DhHMqpExWdmep95hiTgzxcShHjKROpengfwuxPE8ySbAI2SDaJfIOR8q2ZTga
 P6Vc19hA327zONX4eYmC0N4EqENuEQa1oP8xUrIF44XssFEWir9yJ7hdB2Tc6zD/k94k
 7UaiELkh8Y6PsCFjb4a1Vj88iyYtIHRQaYp1RuaavxlAvD1VdHu4EDFwu7+Bf0GEfYUx
 wRIMEsCXotWMr8jAdbEBvs4IaJOc1j0+vHa9ssZzpyUvpUK1SLEbX/yS/HTiQqt2+59L
 8pgziDUzILiEStbI5p5GP4JHduFG029hkqvwzWSKSaB4QKxqRxxV2apS1wobiSBChKZi
 3skw==
X-Gm-Message-State: AAQBX9cWoLLSrS8RJg0JjVrEptKQ8V37yfcz3bQWmbhkCvrGR6fe6HwG
 ng3rFUtB6056zOo9u4G8WC9LIevYjVBqgWjc4vFe5eKYZ+U=
X-Google-Smtp-Source: AKy350aBcUKqIhc1DfXJMTdmFgHjYB6fBBroAlQ+DRY/AnoDLv87KkyWD8fRcFApKz4ojjmHyNT8XDSd4ABc9NZDhIg=
X-Received: by 2002:a1f:b244:0:b0:439:ab95:c2b1 with SMTP id
 b65-20020a1fb244000000b00439ab95c2b1mr1437105vkf.0.1680677141108; Tue, 04 Apr
 2023 23:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230315133510.3511784-1-christoph.muellner@vrull.eu>
 <405a9900-9138-920c-7adb-78797d190f85@linux.alibaba.com>
In-Reply-To: <405a9900-9138-920c-7adb-78797d190f85@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 16:45:14 +1000
Message-ID: <CAKmqyKPQH7dmtJGegO-FpjwixQjTBY7c1MZafKTo+=DzGM==1Q@mail.gmail.com>
Subject: Re: [PATCH] disas/riscv: Add support for XThead* instructions
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 05 Apr 2023 06:45:57 -0000

On Thu, Mar 16, 2023 at 11:31=E2=80=AFAM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/3/15 21:35, Christoph Muellner wrote:
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > Support for emulating XThead* instruction has been added recently.
> > This patch adds support for these instructions to the RISC-V disassembl=
er.
>
> This patch doesn't scale well. It will make the custom encoding only
> work for XTHEAD*. I once sent a multiple disassemble path patch set  for
> custom extensions.
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg906222.html
>
> We may continue this work based on that patch set.

I tend to agree. This integrates vendor instructions pretty tightly
with QEMU which is what we have been trying to avoid.

Alistair

>
> Zhiwei
>
> >
> > Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> > ---
> >   disas/riscv.c | 366 +++++++++++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 365 insertions(+), 1 deletion(-)
> >
> > diff --git a/disas/riscv.c b/disas/riscv.c
> > index d6b0fbe5e8..14f3faaef4 100644
> > --- a/disas/riscv.c
> > +++ b/disas/riscv.c
> > @@ -19,6 +19,7 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "disas/dis-asm.h"
> > +#include "qemu/bitops.h"
> >
> >
> >   /* types */
> > @@ -163,6 +164,12 @@ typedef enum {
> >       rv_codec_v_i,
> >       rv_codec_vsetvli,
> >       rv_codec_vsetivli,
> > +    rv_codec_r2_imm5,
> > +    rv_codec_r2,
> > +    rv_codec_r2_imm6,
> > +    rv_codec_r_imm2,
> > +    rv_codec_r2_immhl,
> > +    rv_codec_r2_imm2_imm5,
> >   } rv_codec;
> >
> >   typedef enum {
> > @@ -935,6 +942,90 @@ typedef enum {
> >       rv_op_vsetvli =3D 766,
> >       rv_op_vsetivli =3D 767,
> >       rv_op_vsetvl =3D 768,
> > +    /* XTheadBa */
> > +    rv_op_th_addsl =3D 769,
> > +    /* XTheadBb */
> > +    rv_op_th_srri =3D 770,
> > +    rv_op_th_srriw =3D 771,
> > +    rv_op_th_ext =3D 772,
> > +    rv_op_th_extu =3D 773,
> > +    rv_op_th_ff0 =3D 774,
> > +    rv_op_th_ff1 =3D 775,
> > +    rv_op_th_rev =3D 776,
> > +    rv_op_th_revw =3D 777,
> > +    rv_op_th_tstnbz =3D 778,
> > +    /* XTheadBs */
> > +    rv_op_th_tst =3D 779,
> > +    /* XTheadCondMov */
> > +    rv_op_th_mveqz =3D 780,
> > +    rv_op_th_mvnez =3D 781,
> > +    /* XTheadFMemIdx */
> > +    rv_op_th_flrd =3D 782,
> > +    rv_op_th_flrw =3D 783,
> > +    rv_op_th_flurd =3D 784,
> > +    rv_op_th_flurw =3D 785,
> > +    rv_op_th_fsrd =3D 786,
> > +    rv_op_th_fsrw =3D 787,
> > +    rv_op_th_fsurd =3D 788,
> > +    rv_op_th_fsurw =3D 789,
> > +    /* XTheadMac */
> > +    rv_op_th_mula =3D 790,
> > +    rv_op_th_mulah =3D 791,
> > +    rv_op_th_mulaw =3D 792,
> > +    rv_op_th_muls =3D 793,
> > +    rv_op_th_mulsw =3D 794,
> > +    rv_op_th_mulsh =3D 795,
> > +    /* XTheadMemIdx */
> > +    rv_op_th_lbia =3D 796,
> > +    rv_op_th_lbib =3D 797,
> > +    rv_op_th_lbuia =3D 798,
> > +    rv_op_th_lbuib =3D 799,
> > +    rv_op_th_lhia =3D 800,
> > +    rv_op_th_lhib =3D 801,
> > +    rv_op_th_lhuia =3D 802,
> > +    rv_op_th_lhuib =3D 803,
> > +    rv_op_th_lwia =3D 804,
> > +    rv_op_th_lwib =3D 805,
> > +    rv_op_th_lwuia =3D 806,
> > +    rv_op_th_lwuib =3D 807,
> > +    rv_op_th_ldia =3D 808,
> > +    rv_op_th_ldib =3D 809,
> > +    rv_op_th_sbia =3D 810,
> > +    rv_op_th_sbib =3D 811,
> > +    rv_op_th_shia =3D 812,
> > +    rv_op_th_shib =3D 813,
> > +    rv_op_th_swia =3D 814,
> > +    rv_op_th_swib =3D 815,
> > +    rv_op_th_sdia =3D 816,
> > +    rv_op_th_sdib =3D 817,
> > +    rv_op_th_lrb =3D 818,
> > +    rv_op_th_lrbu =3D 819,
> > +    rv_op_th_lrh =3D 820,
> > +    rv_op_th_lrhu =3D 821,
> > +    rv_op_th_lrw =3D 822,
> > +    rv_op_th_lrwu =3D 823,
> > +    rv_op_th_lrd =3D 824,
> > +    rv_op_th_srb =3D 825,
> > +    rv_op_th_srh =3D 826,
> > +    rv_op_th_srw =3D 827,
> > +    rv_op_th_srd =3D 828,
> > +    rv_op_th_lurb =3D 829,
> > +    rv_op_th_lurbu =3D 830,
> > +    rv_op_th_lurh =3D 831,
> > +    rv_op_th_lurhu =3D 832,
> > +    rv_op_th_lurw =3D 833,
> > +    rv_op_th_lurwu =3D 834,
> > +    rv_op_th_lurd =3D 835,
> > +    rv_op_th_surb =3D 836,
> > +    rv_op_th_surh =3D 837,
> > +    rv_op_th_surw =3D 838,
> > +    rv_op_th_surd =3D 839,
> > +    /* XTheadMemPair */
> > +    rv_op_th_ldd =3D 840,
> > +    rv_op_th_lwd =3D 841,
> > +    rv_op_th_lwud =3D 842,
> > +    rv_op_th_sdd =3D 843,
> > +    rv_op_th_swd =3D 844,
> >   } rv_op;
> >
> >   /* structures */
> > @@ -943,6 +1034,7 @@ typedef struct {
> >       uint64_t  pc;
> >       uint64_t  inst;
> >       int32_t   imm;
> > +    int32_t   imm1;
> >       uint16_t  op;
> >       uint8_t   codec;
> >       uint8_t   rd;
> > @@ -1071,6 +1163,11 @@ static const char rv_vreg_name_sym[32][4] =3D {
> >   #define rv_fmt_vd_vm                  "O\tDm"
> >   #define rv_fmt_vsetvli                "O\t0,1,v"
> >   #define rv_fmt_vsetivli               "O\t0,u,v"
> > +#define rv_fmt_rd_rs1_rs2_imm         "O\t0,1,2,i"
> > +#define rv_fmt_frd_rs1_rs2_imm        "O\t3,1,2,i"
> > +#define rv_fmt_rd_rs1_immh_imml       "O\t0,1,i,j"
> > +#define rv_fmt_rd_rs1_immh_imml_addr  "O\t0,(1),i,j"
> > +#define rv_fmt_rd2_imm                "O\t0,2,(1),i"
> >
> >   /* pseudo-instruction constraints */
> >
> > @@ -2066,7 +2163,91 @@ const rv_opcode_data opcode_data[] =3D {
> >       { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_=
vf8, rv_op_vsext_vf8, 0 },
> >       { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvl=
i, rv_op_vsetvli, 0 },
> >       { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vse=
tivli, rv_op_vsetivli, 0 },
> > -    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_=
op_vsetvl, 0 }
> > +    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_=
op_vsetvl, 0 },
> > +    /* XTheadBa */
> > +    { "th.addsl", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    /* XTheadBb */
> > +    { "th.srri", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0},
> > +    { "th.srriw", rv_codec_r2_imm5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0},
> > +    { "th.ext", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, 0=
, 0},
> > +    { "th.extu", rv_codec_r2_immhl, rv_fmt_rd_rs1_immh_imml, NULL, 0, =
0, 0},
> > +    { "th.ff0", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> > +    { "th.ff1", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> > +    { "th.rev", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> > +    { "th.revw", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> > +    { "th.tstnbz", rv_codec_r2, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> > +    /* XTheadBs */
> > +    { "th.tst", rv_codec_r2_imm6, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0},
> > +    /* XTheadCondMov */
> > +    { "th.mveqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    { "th.mvnez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    /* XTheadFMemIdx */
> > +    { "th.flrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    { "th.flrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    { "th.flurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0,=
 0 },
> > +    { "th.flurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0,=
 0 },
> > +    { "th.fsrd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    { "th.fsrw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    { "th.fsurd", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0,=
 0 },
> > +    { "th.fsurw", rv_codec_r_imm2, rv_fmt_frd_rs1_rs2_imm, NULL, 0, 0,=
 0 },
> > +    /* XTheadMac */
> > +    { "th.mula", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    { "th.mulaw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    { "th.mulah", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    { "th.muls", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    { "th.mulsw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    { "th.mulsh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> > +    /* XTheadMemIdx */
> > +    { "th.lbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.lbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml, NULL,=
 0, 0, 0 },
> > +    { "th.lbuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr,=
 NULL, 0, 0, 0 },
> > +    { "th.lbuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr,=
 NULL, 0, 0, 0 },
> > +    { "th.lhia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.lhib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.lhuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr,=
 NULL, 0, 0, 0 },
> > +    { "th.lhuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr,=
 NULL, 0, 0, 0 },
> > +    { "th.lwia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.lwib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.lwuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr,=
 NULL, 0, 0, 0 },
> > +    { "th.lwuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr,=
 NULL, 0, 0, 0 },
> > +    { "th.ldia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.ldib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.sbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.sbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.shia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.shib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.swia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.swib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.sdia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.sdib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr, =
NULL, 0, 0, 0 },
> > +    { "th.lrb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.lrbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.lrh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.lrhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.lrw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.lrwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.lrd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.srb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.srh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.srw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.srd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0 =
},
> > +    { "th.lurb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.lurbu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    { "th.lurh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.lurhu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    { "th.lurw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.lurwu", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, =
0 },
> > +    { "th.lurd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.surb", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.surh", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.surw", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    { "th.surd", rv_codec_r_imm2, rv_fmt_rd_rs1_rs2_imm, NULL, 0, 0, 0=
 },
> > +    /* XTheadMemPair */
> > +    { "th.ldd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> > +    { "th.lwd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> > +    { "th.lwud", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> > +    { "th.sdd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> > +    { "th.swd", rv_codec_r_imm2, rv_fmt_rd2_imm, NULL, 0, 0, 0 },
> >   };
> >
> >   /* CSR names */
> > @@ -2528,6 +2709,133 @@ static void decode_inst_opcode(rv_decode *dec, =
rv_isa isa)
> >                   break;
> >               }
> >               break;
> > +        case 2:
> > +            /* custom-0 */
> > +            switch ((inst >> 12) & 0b111) {
> > +            case 0: /* ingore priviledged inst */ break;
> > +            case 1:
> > +                switch ((inst >> 25) & 0b1111111) {
> > +                case 0b0001010: op =3D rv_op_th_srriw; break;
> > +                case 0b0010000: op =3D rv_op_th_mula; break;
> > +                case 0b0010001: op =3D rv_op_th_muls; break;
> > +                case 0b0010010: op =3D rv_op_th_mulaw; break;
> > +                case 0b0010011: op =3D rv_op_th_mulsw; break;
> > +                case 0b0010100: op =3D rv_op_th_mulah; break;
> > +                case 0b0010101: op =3D rv_op_th_mulsh; break;
> > +                case 0b0100000: op =3D rv_op_th_mveqz; break;
> > +                case 0b0100001: op =3D rv_op_th_mvnez; break;
> > +                case 0b1000000:
> > +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> > +                        op =3D rv_op_th_tstnbz;
> > +                    }
> > +                    break;
> > +                case 0b1000001:
> > +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> > +                        op =3D rv_op_th_rev;
> > +                    }
> > +                    break;
> > +                case 0b1000010:
> > +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> > +                        op =3D rv_op_th_ff0;
> > +                    }
> > +                    break;
> > +                case 0b1000011:
> > +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> > +                        op =3D rv_op_th_ff1;
> > +                    }
> > +                    break;
> > +                case 0b1000100:
> > +                case 0b1000101: op =3D rv_op_th_tst; break;
> > +                case 0b1001000:
> > +                    if (((inst >> 20) & 0b11111) =3D=3D 0) {
> > +                        op =3D rv_op_th_revw;
> > +                    }
> > +                    break;
> > +                case 0b0000000:
> > +                case 0b0000001:
> > +                case 0b0000010:
> > +                case 0b0000011: op =3D rv_op_th_addsl; break;
> > +                case 0b0000100:
> > +                case 0b0000101: op =3D rv_op_th_srri; break;
> > +                }
> > +                break;
> > +            case 2: op =3D rv_op_th_ext; break;
> > +            case 3: op =3D rv_op_th_extu; break;
> > +            case 4:
> > +                switch ((inst >> 27) & 0b11111) {
> > +                case 0: op =3D rv_op_th_lrb; break;
> > +                case 1: op =3D rv_op_th_lbib; break;
> > +                case 2: op =3D rv_op_th_lurb; break;
> > +                case 3: op =3D rv_op_th_lbia; break;
> > +                case 4: op =3D rv_op_th_lrh; break;
> > +                case 5: op =3D rv_op_th_lhib; break;
> > +                case 6: op =3D rv_op_th_lurh; break;
> > +                case 7: op =3D rv_op_th_lhia; break;
> > +                case 8: op =3D rv_op_th_lrw; break;
> > +                case 9: op =3D rv_op_th_lwib; break;
> > +                case 10: op =3D rv_op_th_lurw; break;
> > +                case 11: op =3D rv_op_th_lwia; break;
> > +                case 12: op =3D rv_op_th_lrd; break;
> > +                case 13: op =3D rv_op_th_ldib; break;
> > +                case 14: op =3D rv_op_th_lurd; break;
> > +                case 15: op =3D rv_op_th_ldia; break;
> > +                case 16: op =3D rv_op_th_lrbu; break;
> > +                case 17: op =3D rv_op_th_lbuib; break;
> > +                case 18: op =3D rv_op_th_lurbu; break;
> > +                case 19: op =3D rv_op_th_lbuia; break;
> > +                case 20: op =3D rv_op_th_lrhu; break;
> > +                case 21: op =3D rv_op_th_lhuib; break;
> > +                case 22: op =3D rv_op_th_lurhu; break;
> > +                case 23: op =3D rv_op_th_lhuia; break;
> > +                case 24: op =3D rv_op_th_lrwu; break;
> > +                case 25: op =3D rv_op_th_lwuib; break;
> > +                case 26: op =3D rv_op_th_lurwu; break;
> > +                case 27: op =3D rv_op_th_lwuia; break;
> > +                case 28: op =3D rv_op_th_lwd; break;
> > +                case 30: op =3D rv_op_th_lwud; break;
> > +                case 31: op =3D rv_op_th_ldd; break;
> > +                }
> > +                break;
> > +            case 5:
> > +                switch ((inst >> 27) & 0b11111) {
> > +                case 0: op =3D rv_op_th_srb; break;
> > +                case 1: op =3D rv_op_th_sbib; break;
> > +                case 2: op =3D rv_op_th_surb; break;
> > +                case 3: op =3D rv_op_th_sbia; break;
> > +                case 4: op =3D rv_op_th_srh; break;
> > +                case 5: op =3D rv_op_th_shib; break;
> > +                case 6: op =3D rv_op_th_surh; break;
> > +                case 7: op =3D rv_op_th_shia; break;
> > +                case 8: op =3D rv_op_th_srw; break;
> > +                case 9: op =3D rv_op_th_swib; break;
> > +                case 10: op =3D rv_op_th_surw; break;
> > +                case 11: op =3D rv_op_th_swia; break;
> > +                case 12: op =3D rv_op_th_srd; break;
> > +                case 13: op =3D rv_op_th_sdib; break;
> > +                case 14: op =3D rv_op_th_surd; break;
> > +                case 15: op =3D rv_op_th_sdia; break;
> > +                case 28: op =3D rv_op_th_swd; break;
> > +                case 31: op =3D rv_op_th_sdd; break;
> > +                }
> > +                break;
> > +            case 6:
> > +                switch ((inst >> 27) & 0b11111) {
> > +                case 8: op =3D rv_op_th_flrw; break;
> > +                case 10: op =3D rv_op_th_flurw; break;
> > +                case 12: op =3D rv_op_th_flrd; break;
> > +                case 14: op =3D rv_op_th_flurd; break;
> > +                }
> > +                break;
> > +            case 7:
> > +                switch ((inst >> 27) & 0b11111) {
> > +                case 8: op =3D rv_op_th_fsrw; break;
> > +                case 10: op =3D rv_op_th_fsurw; break;
> > +                case 12: op =3D rv_op_th_fsrd; break;
> > +                case 14: op =3D rv_op_th_fsurd; break;
> > +                }
> > +                break;
> > +            }
> > +            break;
> >           case 3:
> >               switch (((inst >> 12) & 0b111)) {
> >               case 0: op =3D rv_op_fence; break;
> > @@ -3884,6 +4192,26 @@ static uint32_t operand_vm(rv_inst inst)
> >       return (inst << 38) >> 63;
> >   }
> >
> > +static uint32_t operand_imm6(rv_inst inst)
> > +{
> > +    return (inst << 38) >> 60;
> > +}
> > +
> > +static uint32_t operand_imm2(rv_inst inst)
> > +{
> > +    return (inst << 37) >> 62;
> > +}
> > +
> > +static uint32_t operand_immh(rv_inst inst)
> > +{
> > +    return (inst << 32) >> 58;
> > +}
> > +
> > +static uint32_t operand_imml(rv_inst inst)
> > +{
> > +    return (inst << 38) >> 58;
> > +}
> > +
> >   /* decode operands */
> >
> >   static void decode_inst_operands(rv_decode *dec, rv_isa isa)
> > @@ -4200,6 +4528,38 @@ static void decode_inst_operands(rv_decode *dec,=
 rv_isa isa)
> >           dec->imm =3D operand_vimm(inst);
> >           dec->vzimm =3D operand_vzimm10(inst);
> >           break;
> > +    case rv_codec_r2_imm5:
> > +        dec->rd =3D operand_rd(inst);
> > +        dec->rs1 =3D operand_rs1(inst);
> > +        dec->imm =3D operand_rs2(inst);
> > +        break;
> > +    case rv_codec_r2:
> > +        dec->rd =3D operand_rd(inst);
> > +        dec->rs1 =3D operand_rs1(inst);
> > +        break;
> > +    case rv_codec_r2_imm6:
> > +        dec->rd =3D operand_rd(inst);
> > +        dec->rs1 =3D operand_rs1(inst);
> > +        dec->imm =3D operand_imm6(inst);
> > +        break;
> > +    case rv_codec_r_imm2:
> > +        dec->rd =3D operand_rd(inst);
> > +        dec->rs1 =3D operand_rs1(inst);
> > +        dec->rs2 =3D operand_rs2(inst);
> > +        dec->imm =3D operand_imm2(inst);
> > +        break;
> > +    case rv_codec_r2_immhl:
> > +        dec->rd =3D operand_rd(inst);
> > +        dec->rs1 =3D operand_rs1(inst);
> > +        dec->imm =3D operand_immh(inst);
> > +        dec->imm1 =3D operand_imml(inst);
> > +        break;
> > +    case rv_codec_r2_imm2_imm5:
> > +        dec->rd =3D operand_rd(inst);
> > +        dec->rs1 =3D operand_rs1(inst);
> > +        dec->imm =3D sextract32(operand_rs2(inst), 0, 5);
> > +        dec->imm1 =3D operand_imm2(inst);
> > +        break;
> >       };
> >   }
> >
> > @@ -4396,6 +4756,10 @@ static void format_inst(char *buf, size_t buflen=
, size_t tab, rv_decode *dec)
> >               snprintf(tmp, sizeof(tmp), "%d", dec->imm);
> >               append(buf, tmp, buflen);
> >               break;
> > +        case 'j':
> > +            snprintf(tmp, sizeof(tmp), "%d", dec->imm1);
> > +            append(buf, tmp, buflen);
> > +            break;
> >           case 'u':
> >               snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b=
11111));
> >               append(buf, tmp, buflen);
>

