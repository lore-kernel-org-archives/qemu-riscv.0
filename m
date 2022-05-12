Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npD4b-0000KJ-TL
	for mharc-qemu-riscv@gnu.org; Thu, 12 May 2022 13:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1npD4Z-0000Fv-Sm
 for qemu-riscv@nongnu.org; Thu, 12 May 2022 13:58:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1npD4W-0001gx-Is
 for qemu-riscv@nongnu.org; Thu, 12 May 2022 13:57:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id j14so5642486plx.3
 for <qemu-riscv@nongnu.org>; Thu, 12 May 2022 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QXNHMF7lOmLqzBwjv5BnCrB3yANgL5rg2UjX4M9Sz8o=;
 b=ujj7zVluPpUBdZxvFNiC0bCV0fuwcYwOSmpNJiwYCdrr4wOBWFmW2d5ua0FlULGtBb
 rODyJDYC5/mIwMm5iNDmIyd+4sluRkQDnvPWWkFZikohV96X/vV+iONFIAttuYcM9kUm
 59baOWhVn6q9yuEYz9OEOqMyQTWDDarxfO/iprlNJ1tMWe48fxqYSqHOGFGYb0xgttE2
 iYy+0QQCpzOYvN6CTFz9sQDHKRr6e23WKi/QCqiPNO4i86Fp13GE2Kx+9Rzkt9aVvK+Y
 SK1gKdYxNxXFkMrgiYHWwvJTaxOD65n14elpTvjv1cDA13A7e7VJWE4iMQnhjYwXMzFR
 oslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QXNHMF7lOmLqzBwjv5BnCrB3yANgL5rg2UjX4M9Sz8o=;
 b=sAFF539Hn2qVjOfVsO1pQcCIXjOC5h01hswa/7ibAYTef5woVSK66KJ9vCPaQYS6as
 CKBUpr34qs5qlY3mQ3jT316XWdZMBj45y+ZgxAVgDHVwXil36iwcoy0szy8XseT58txO
 gR2I8LZG0hsJH6Lzat3IZLwHxr4xRUa5jWi1EPgGYBLVta4qk5XVfi2TMWfkxHkAxFXz
 C2AjBcWFQdWwtyhO8Y30Lcv2mMu0FHcy+MkIUiG8sK729kYVLeohsa6r6iRUgJm68XDp
 ZOfpPdMeHzgbGjpxP9lepbBtT6nEjnJyly1fo6gZOWQFnHTxtIaeAjsInR0plA3bdoYV
 yUSQ==
X-Gm-Message-State: AOAM530F0OLm+EA/clx+YI35WmrugvBd/2nCGBf0D8seV5fiumqAzAGl
 OcJug/gEVU6UoTruCOmBRO7HmP5WqWSUCCOwfJ0m7Q==
X-Google-Smtp-Source: ABdhPJw0Sp5jRYNTeuNGVYFltfhY95NiIV3gYdilve7o8cwIRq6xyS72ztb3vJvoNDAy8bBJC9JhvOkhP1hdG9pFRHI=
X-Received: by 2002:a17:902:8504:b0:15d:2c7c:ceac with SMTP id
 bj4-20020a170902850400b0015d2c7cceacmr1043131plb.130.1652378273568; Thu, 12
 May 2022 10:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220510064231.1384670-1-daolu@rivosinc.com>
 <20220510064231.1384670-2-daolu@rivosinc.com>
 <3eca76b7-9024-ab31-9306-c7a25a0779a7@irq.a4lg.com>
In-Reply-To: <3eca76b7-9024-ab31-9306-c7a25a0779a7@irq.a4lg.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Thu, 12 May 2022 10:57:42 -0700
Message-ID: <CAKh7v-RAhNAdC97aSHhGm==7=AD0snS6TZkYedX7S3Sm0RfemA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Add Zihintpause support
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=daolu@rivosinc.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 May 2022 17:58:00 -0000

Thanks to Heiko and Tsukasa.

I have made the following changes:

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc
b/target/riscv/insn_trans/trans_rvi.c.inc
index acd2548e9b..ca75e05f4b 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -18,12 +18,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */

-#define REQUIRE_ZIHINTPAUSE(ctx) do { \
-    if (!ctx->cfg_ptr->ext_zihintpause) {      \
-        return false;         \
-    }                         \
-} while (0)
-
 static bool trans_illegal(DisasContext *ctx, arg_empty *a)
 {
     gen_exception_illegal(ctx);
@@ -804,7 +798,9 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)

 static bool trans_pause(DisasContext *ctx, arg_pause *a)
 {
-    REQUIRE_ZIHINTPAUSE(ctx);
+    if (!ctx->cfg_ptr->ext_zihintpause) {
+        return false;
+    }

     /*
      * PAUSE is a no-op in QEMU,


On Thu, May 12, 2022 at 5:20 AM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> On 2022/05/10 15:42, Dao Lu wrote:
> > Added support for RISC-V PAUSE instruction from Zihintpause extension, enabeld
> > by default.
> >
> > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > ---
> >  target/riscv/cpu.c                      |  2 ++
> >  target/riscv/cpu.h                      |  1 +
> >  target/riscv/insn32.decode              |  7 ++++++-
> >  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
> >  4 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ccacdee215..183fb37fdf 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > +    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
>
> This is not your fault but mixed upper camel case and lower case is not a
> good situation (e.g. "Zihintpause" and "zba").  I will raise a separate
> issue on qemu-riscv mailing list (no changes requested).
>
>
> >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > @@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> >       *    extensions by an underscore.
> >       */
> >      struct isa_ext_data isa_edata_arr[] = {
> > +        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
> >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index fe6c9a2c92..e466a04a59 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -394,6 +394,7 @@ struct RISCVCPUConfig {
> >      bool ext_counters;
> >      bool ext_ifencei;
> >      bool ext_icsr;
> > +    bool ext_zihintpause;
> >      bool ext_svinval;
> >      bool ext_svnapot;
> >      bool ext_svpbmt;
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 4033565393..595fdcdad8 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
> >  sra      0100000 .....    ..... 101 ..... 0110011 @r
> >  or       0000000 .....    ..... 110 ..... 0110011 @r
> >  and      0000000 .....    ..... 111 ..... 0110011 @r
> > -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> > +
> > +{
> > +  pause  0000 0001   0000   00000 000 00000 0001111
> > +  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
> > +}
> > +
> >  fence_i  ---- ----   ----   ----- 001 ----- 0001111
> >  csrrw    ............     ..... 001 ..... 1110011 @csr
> >  csrrs    ............     ..... 010 ..... 1110011 @csr
> > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> > index f1342f30f8..528c30c9a2 100644
> > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > @@ -18,6 +18,12 @@
> >   * this program.  If not, see <http://www.gnu.org/licenses/>.
> >   */
> >
> > +#define REQUIRE_ZIHINTPAUSE(ctx) do { \
> > +    if (!ctx->cfg_ptr->ext_zihintpause) {      \
> > +        return false;         \
> > +    }                         \
> > +} while (0)
>
> I think this macro is too much for one instruction.  How about expanding
> this on `trans_pause' function like `trans_fence_i'?
>
> Other than that, it LGTM.
>
> Tsukasa,
>
> > +
> >  static bool trans_illegal(DisasContext *ctx, arg_empty *a)
> >  {
> >      gen_exception_illegal(ctx);
> > @@ -796,6 +802,18 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
> >      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
> >  }
> >
> > +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> > +{
> > +    REQUIRE_ZIHINTPAUSE(ctx);
> > +
> > +    /*
> > +     * PAUSE is a no-op in QEMU,
> > +     * however we need to clear the reservation
> > +     */
> > +    tcg_gen_movi_tl(load_res, -1);
> > +
> > +    return true;
> > +}
> >
> >  static bool trans_fence(DisasContext *ctx, arg_fence *a)
> >  {

