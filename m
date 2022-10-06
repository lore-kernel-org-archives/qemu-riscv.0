Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogUKI-0002Ha-Ag
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 13:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ogUKD-000263-Mt
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 13:06:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ogUKA-0006A3-FU
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 13:06:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so2372637pjk.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Oct 2022 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
 :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yKaD/R3/C1Hpn4Pj7UJP5JQHTfh9voBLDqH5MOY2HxI=;
 b=lsmcZ2APG2YWpQQti5q93NEO0chaEiyGR2reaUrKhYtdnD114OTXMQD5A8CkG2jz6E
 YRazu7l4YkrDtPQ0/HBf1uQbGjBQjx66VTmhFJIhq6ot0bxPSMgi7URCNw7XjbH9mJcB
 qA+fkitjJsFBfeRSndj9YZ9e3zB2fsRN2cLtnqwHVheS+q+v3KI5HMInMT62ImLAEmPu
 cYN66muHK006nOQLgCRZxoew1RLGl/TewJ0QMrWIaPxTmMKxe1rYm7P7We0f5S/laA09
 lQWg1pr8xUxozgMIqcWM3A5suIrFgIjiLUhd+hEuHa3ipGaNCYMObUnyMmG+SySVQu6y
 L2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
 :subject:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKaD/R3/C1Hpn4Pj7UJP5JQHTfh9voBLDqH5MOY2HxI=;
 b=PnJDPOgub1/hvJu+m+wN3IuDvGXSl+lQbeW2os9DLR8zJ4t0+Q+FNRoEqAg1uK2Rl/
 qKeRtYguqIsbcLtCbUDhx2T4SOvcVYW0FqVntlDpDQk5uXFkdCgtKcnW6hvOTHCdZM3t
 V1HwvjlAzl1hHHXxJmy3zjB1nOl2Ur3Tc5a9L28y9+2qn+evbS+BSLdCVdog5wvM/tWc
 YGLGJt6bCEiLRX4fhvyeEBWT4RIhhhRWL8VIIJVSE0xKuCk4DpB3F9UiPhSFHffKYES9
 W+AHMFbxFHkYsleMbhwJJS91qAc8jBsrizuDbK8y7TUwW+3GxRBxoE18nLEpjo0y4u+B
 8qfQ==
X-Gm-Message-State: ACrzQf3isxFYygLVGEOdYnnxsF85XPz5ylw0Rp2VcpFN7Zek0xepeVVS
 9zoDu+Rgb3vB5LdUFkS9gWQtSA==
X-Google-Smtp-Source: AMsMyM7CU2pbnU96zAHuwNg9el0ULZSFjtPEONPwiM0Ir8auB4XQhnCTGQWdACDbOYYkvJ0yV8jUzA==
X-Received: by 2002:a17:90b:3144:b0:202:e2cd:2d2a with SMTP id
 ip4-20020a17090b314400b00202e2cd2d2amr676102pjb.39.1665075976427; 
 Thu, 06 Oct 2022 10:06:16 -0700 (PDT)
Received: from [192.168.1.5] ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001788ccecbf5sm1541290pld.31.2022.10.06.10.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 10:06:15 -0700 (PDT)
Message-ID: <d71922fec571b4aca2266de29eb4b8e4be9769c7.camel@ventanamicro.com>
Subject: Re: [PATCH v10 4/5] target/riscv: smstateen check for fcsr
From: mchitale@ventanamicro.com
To: weiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
Date: Thu, 06 Oct 2022 22:36:10 +0530
In-Reply-To: <b719c988-6990-419a-7ca4-cb4e73ccc27d@iscas.ac.cn>
References: <20221003114718.30659-1-mchitale@ventanamicro.com>
 <20221003114718.30659-5-mchitale@ventanamicro.com>
 <404205f5-9626-23b3-d388-b2288293c7d1@iscas.ac.cn>
 <d7c8fc4fc255a23850d78da6c937e57e85ce09c7.camel@ventanamicro.com>
 <b719c988-6990-419a-7ca4-cb4e73ccc27d@iscas.ac.cn>
Content-Type: multipart/alternative; boundary="=-ok35VPksaYy2IEbOXLos"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Thu, 06 Oct 2022 17:06:22 -0000


--=-ok35VPksaYy2IEbOXLos
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2022-10-04 at 21:23 +0800, weiwei wrote:
>     
> 
>     
> 
>     On 2022/10/4 14:51,
>       mchitale@ventanamicro.com wrote:
> 
>     
> 
>     
> >       On Mon, 2022-10-03 at 21:02 +0800, weiwei wrote:
> >       
> > >         On 2022/10/3 19:47, Mayuresh Chitale wrote:
> > >         
> > > >           If smstateen is implemented and sstateen0.fcsr is
> > > > clear then thefloating pointoperations must return illegal
> > > > instruction exception or virtualinstructiontrap, if relevant.
> > > > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > > > ---  target/riscv/csr.c                        | 23
> > > > ++++++++++++  target/riscv/insn_trans/trans_rvf.c.inc   |
> > > > 43+++++++++++++++++++++
> > > > --  target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++  3
> > > > files changed, 75 insertions(+), 3 deletions(-)
> > > > diff --git a/target/riscv/csr.c b/target/riscv/csr.cindex
> > > > 71236f2b5d..8b25f885ec 100644--- a/target/riscv/csr.c+++
> > > > b/target/riscv/csr.c@@ -84,6 +84,10 @@ static RISCVException
> > > > fs(CPURISCVState *env,
> > > > intcsrno)          !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx)
> > > > {          return RISCV_EXCP_ILLEGAL_INST;      }++    if
> > > > (!env->debugger && !riscv_cpu_fp_enabled(env)) {+        return
> > > > smstateen_acc_ok(env, 0,
> > > > SMSTATEEN0_FCSR);+    }  #endif      return
> > > > RISCV_EXCP_NONE;  }@@ -2023,6 +2027,9 @@ static
> > > > RISCVExceptionwrite_mstateen0(CPURISCVState *env, int
> > > > csrno,                                        target_ulong
> > > > new_val)  {      uint64_t wr_mask = SMSTATEEN_STATEEN |
> > > > SMSTATEEN0_HSENVCFG;+    if (!riscv_has_ext(env, RVF))
> > > > {+        wr_mask |= SMSTATEEN0_FCSR;+    }        return
> > > > write_mstateen(env, csrno, wr_mask, new_val);  }@@ -2059,6
> > > > +2066,10 @@ static RISCVExceptionwrite_mstateen0h(CPURISCVState
> > > > *env, int csrno,  {      uint64_t wr_mask = SMSTATEEN_STATEEN |
> > > > SMSTATEEN0_HSENVCFG;  +    if (!riscv_has_ext(env, RVF))
> > > > {+        wr_mask |= SMSTATEEN0_FCSR;+    }+      return
> > > > write_mstateenh(env, csrno, wr_mask, new_val);  }  @@ -2096,6
> > > > +2107,10 @@ static RISCVExceptionwrite_hstateen0(CPURISCVState
> > > > *env, int csrno,  {      uint64_t wr_mask = SMSTATEEN_STATEEN |
> > > > SMSTATEEN0_HSENVCFG;  +    if (!riscv_has_ext(env, RVF))
> > > > {+        wr_mask |= SMSTATEEN0_FCSR;+    }+      return
> > > > write_hstateen(env, csrno, wr_mask, new_val);  }  @@ -2135,6
> > > > +2150,10 @@ static RISCVExceptionwrite_hstateen0h(CPURISCVState
> > > > *env, int csrno,  {      uint64_t wr_mask = SMSTATEEN_STATEEN |
> > > > SMSTATEEN0_HSENVCFG;  +    if (!riscv_has_ext(env, RVF))
> > > > {+        wr_mask |= SMSTATEEN0_FCSR;+    }+      return
> > > > write_hstateenh(env, csrno, wr_mask, new_val);  }  @@ -2182,6
> > > > +2201,10 @@ static RISCVExceptionwrite_sstateen0(CPURISCVState
> > > > *env, int csrno,  {      uint64_t wr_mask = SMSTATEEN_STATEEN |
> > > > SMSTATEEN0_HSENVCFG;  +    if (!riscv_has_ext(env, RVF))
> > > > {+        wr_mask |= SMSTATEEN0_FCSR;+    }+      return
> > > > write_sstateen(env, csrno, wr_mask, new_val);  }  diff --git
> > > > a/target/riscv/insn_trans/trans_rvf.c.incb/target/riscv/insn_tr
> > > > ans/trans_rvf.c.incindex a1d3eb52ad..93657680c6 100644---
> > > > a/target/riscv/insn_trans/trans_rvf.c.inc+++
> > > > b/target/riscv/insn_trans/trans_rvf.c.inc@@ -24,9 +24,46
> > > > @@              return false; \  } while (0)  -#define
> > > > REQUIRE_ZFINX_OR_F(ctx) do {\-    if (!ctx->cfg_ptr->ext_zfinx) 
> > > > { \-        REQUIRE_EXT(ctx, RVF); \+#ifndef
> > > > CONFIG_USER_ONLY+static inline bool
> > > > smstateen_fcsr_check(DisasContext *ctx,
> > > > intindex)+{+    CPUState *cpu = ctx->cs;+    CPURISCVState *env
> > > > = cpu->env_ptr;+    uint64_t stateen = env-
> > > > >mstateen[index];++    if (!ctx->cfg_ptr->ext_smstateen || env-
> > > > >priv == PRV_M) {+        return true;+    }++    if (ctx-
> > > > >virt_enabled) {+        stateen &= env-
> > > > >hstateen[index];+    }++    if (env->priv == PRV_U &&
> > > > has_ext(ctx, RVS)) {+        stateen &= env-
> > > > >sstateen[index];+    }++    if (!(stateen & SMSTATEEN0_FCSR))
> > > > {+        if (ctx->virt_enabled) {+            ctx-
> > > > >virt_inst_excp = true;+        }
> > > >         
> > > 
> > >         Are there any considerations for adding  virt_inst_excp
> > > instead ofdirectly
> > > "generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)"
> > > here?
> > > Regards,
> > > Weiwei Li
> > >       
> > 
> >       I had considered it but I think this is a simpler approach as
> > the restof the code path stays the same as generating an illegal
> > instructionexception, for e.g setting the bins value (tval).
> >     
> 
>     OK,  we did need to set bins value for virt instruction
>       exception. However I prefer directly call a 
> 
>     
> 
>     new gen_exception_virt function(similar to gen_exception_illegal)
> here.
> 
>     
> >        Also we need toreturn true from all the caller trans_*
> > functions even if the smstateencheck has failed.
> >     
> 
>     False is returned when smstateen check fails currently.
Yes, however if we make this change then should return true if the
check fails so that the decode_opc doesnt fall through and generate
another exception. It can be done but it would be contrary to the
general convention.
>     Regards,
>     Weiwei Li
> 
>     
>     
> >       
> >       
> > >         
> > >         
> > > >           +        return false;+    }++    return
> > > > true;+}+#else+#define smstateen_fcsr_check(ctx, index)
> > > > (true)+#endif++#define REQUIRE_ZFINX_OR_F(ctx) do { \+    if
> > > > (!has_ext(ctx, RVF)) { \+        if (!ctx->cfg_ptr->ext_zfinx)
> > > > { \+            return false; \+        } \+        if
> > > > (!smstateen_fcsr_check(ctx, 0)) { \+            return false;
> > > > \+        } \      } \  } while (0)  diff --git
> > > > a/target/riscv/insn_trans/trans_rvzfh.c.incb/target/riscv/insn_
> > > > trans/trans_rvzfh.c.incindex 5d07150cd0..6c2e338c0a 100644---
> > > > a/target/riscv/insn_trans/trans_rvzfh.c.inc+++
> > > > b/target/riscv/insn_trans/trans_rvzfh.c.inc@@ -20,18 +20,27
> > > > @@      if (!ctx->cfg_ptr->ext_zfh) {      \          return
> > > > false;         \      }                         \+    if
> > > > (!smstateen_fcsr_check(ctx, 0)) { \+        return false;
> > > > \+    } \  } while (0)    #define REQUIRE_ZHINX_OR_ZFH(ctx) do
> > > > { \      if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr-
> > > > >ext_zfh) { \          return
> > > > false;                  \      }                               
> > > >    \+    if (!smstateen_fcsr_check(ctx, 0)) { \+        return
> > > > false; \+    } \  } while (0)    #define
> > > > REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \      if (!(ctx-
> > > > >cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) {
> > > > \          return
> > > > false;                         \      }                        
> > > >                  \+    if (!smstateen_fcsr_check(ctx, 0)) {
> > > > \+        return false; \+    } \  } while (0)    #define
> > > > REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \@@ -39,6
> > > > +48,9 @@            ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr-
> > > > >ext_zhinxmin)) {     \          return
> > > > false;                                        \      }         
> > > >                                                \+    if
> > > > (!smstateen_fcsr_check(ctx, 0)) { \+        return false;
> > > > \+    } \  } while (0)    static bool trans_flh(DisasContext
> > > > *ctx, arg_flh *a)
> > > >         
> > > 
> > >       
> > 
> >     
> 
>   
> 

--=-ok35VPksaYy2IEbOXLos
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body style=3D"text-align:left; direction:ltr;"><div>On Tue, 2022-10-04 a=
t 21:23 +0800, weiwei wrote:</div><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2022/10/4 14:51,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:mchitale@ventana=
micro.com">mchitale@ventanamicro.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:d7c8fc4fc255a23850d78da6c937e57e8=
5ce09c7.camel@ventanamicro.com" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex">
      <pre>On Mon, 2022-10-03 at 21:02 +0800, weiwei wrote:</pre>
      <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex">
        <pre>On 2022/10/3 19:47, Mayuresh Chitale wrote:</pre>
        <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex">
          <pre>If smstateen is implemented and sstateen0.fcsr is clear then=
 the</pre><pre>floating point</pre><pre>operations must return illegal inst=
ruction exception or virtual</pre><pre>instruction</pre><pre>trap, if relev=
ant.</pre><pre><br></pre><pre>Signed-off-by: Mayuresh Chitale </pre><a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:mchitale@ventanamicro.com"><pre>=
&lt;mchitale@ventanamicro.com&gt;</pre></a><pre><br></pre><pre>---</pre><pr=
e>  target/riscv/csr.c                        | 23 ++++++++++++</pre><pre> =
 target/riscv/insn_trans/trans_rvf.c.inc   | 43</pre><pre>+++++++++++++++++=
++++--</pre><pre>  target/riscv/insn_trans/trans_rvzfh.c.inc | 12 +++++++</=
pre><pre>  3 files changed, 75 insertions(+), 3 deletions(-)</pre><pre><br>=
</pre><pre>diff --git a/target/riscv/csr.c b/target/riscv/csr.c</pre><pre>i=
ndex 71236f2b5d..8b25f885ec 100644</pre><pre>--- a/target/riscv/csr.c</pre>=
<pre>+++ b/target/riscv/csr.c</pre><pre>@@ -84,6 +84,10 @@ static RISCVExce=
ption fs(CPURISCVState *env, int</pre><pre>csrno)</pre><pre>          !RISC=
V_CPU(env_cpu(env))-&gt;cfg.ext_zfinx) {</pre><pre>          return RISCV_E=
XCP_ILLEGAL_INST;</pre><pre>      }</pre><pre>+</pre><pre>+    if (!env-&gt=
;debugger &amp;&amp; !riscv_cpu_fp_enabled(env)) {</pre><pre>+        retur=
n smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);</pre><pre>+    }</pre><pre>  #=
endif</pre><pre>      return RISCV_EXCP_NONE;</pre><pre>  }</pre><pre>@@ -2=
023,6 +2027,9 @@ static RISCVException</pre><pre>write_mstateen0(CPURISCVSt=
ate *env, int csrno,</pre><pre>                                        targ=
et_ulong new_val)</pre><pre>  {</pre><pre>      uint64_t wr_mask =3D SMSTAT=
EEN_STATEEN | SMSTATEEN0_HSENVCFG;</pre><pre>+    if (!riscv_has_ext(env, R=
VF)) {</pre><pre>+        wr_mask |=3D SMSTATEEN0_FCSR;</pre><pre>+    }</p=
re><pre>  </pre><pre>      return write_mstateen(env, csrno, wr_mask, new_v=
al);</pre><pre>  }</pre><pre>@@ -2059,6 +2066,10 @@ static RISCVException</=
pre><pre>write_mstateen0h(CPURISCVState *env, int csrno,</pre><pre>  {</pre=
><pre>      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;</=
pre><pre>  </pre><pre>+    if (!riscv_has_ext(env, RVF)) {</pre><pre>+     =
   wr_mask |=3D SMSTATEEN0_FCSR;</pre><pre>+    }</pre><pre>+</pre><pre>   =
   return write_mstateenh(env, csrno, wr_mask, new_val);</pre><pre>  }</pre=
><pre>  </pre><pre>@@ -2096,6 +2107,10 @@ static RISCVException</pre><pre>w=
rite_hstateen0(CPURISCVState *env, int csrno,</pre><pre>  {</pre><pre>     =
 uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;</pre><pre>  =
</pre><pre>+    if (!riscv_has_ext(env, RVF)) {</pre><pre>+        wr_mask =
|=3D SMSTATEEN0_FCSR;</pre><pre>+    }</pre><pre>+</pre><pre>      return w=
rite_hstateen(env, csrno, wr_mask, new_val);</pre><pre>  }</pre><pre>  </pr=
e><pre>@@ -2135,6 +2150,10 @@ static RISCVException</pre><pre>write_hstatee=
n0h(CPURISCVState *env, int csrno,</pre><pre>  {</pre><pre>      uint64_t w=
r_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;</pre><pre>  </pre><pre>=
+    if (!riscv_has_ext(env, RVF)) {</pre><pre>+        wr_mask |=3D SMSTAT=
EEN0_FCSR;</pre><pre>+    }</pre><pre>+</pre><pre>      return write_hstate=
enh(env, csrno, wr_mask, new_val);</pre><pre>  }</pre><pre>  </pre><pre>@@ =
-2182,6 +2201,10 @@ static RISCVException</pre><pre>write_sstateen0(CPURISC=
VState *env, int csrno,</pre><pre>  {</pre><pre>      uint64_t wr_mask =3D =
SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;</pre><pre>  </pre><pre>+    if (!r=
iscv_has_ext(env, RVF)) {</pre><pre>+        wr_mask |=3D SMSTATEEN0_FCSR;<=
/pre><pre>+    }</pre><pre>+</pre><pre>      return write_sstateen(env, csr=
no, wr_mask, new_val);</pre><pre>  }</pre><pre>  </pre><pre>diff --git a/ta=
rget/riscv/insn_trans/trans_rvf.c.inc</pre><pre>b/target/riscv/insn_trans/t=
rans_rvf.c.inc</pre><pre>index a1d3eb52ad..93657680c6 100644</pre><pre>--- =
a/target/riscv/insn_trans/trans_rvf.c.inc</pre><pre>+++ b/target/riscv/insn=
_trans/trans_rvf.c.inc</pre><pre>@@ -24,9 +24,46 @@</pre><pre>             =
 return false; \</pre><pre>  } while (0)</pre><pre>  </pre><pre>-#define RE=
QUIRE_ZFINX_OR_F(ctx) do {\</pre><pre>-    if (!ctx-&gt;cfg_ptr-&gt;ext_zfi=
nx) { \</pre><pre>-        REQUIRE_EXT(ctx, RVF); \</pre><pre>+#ifndef CONF=
IG_USER_ONLY</pre><pre>+static inline bool smstateen_fcsr_check(DisasContex=
t *ctx, int</pre><pre>index)</pre><pre>+{</pre><pre>+    CPUState *cpu =3D =
ctx-&gt;cs;</pre><pre>+    CPURISCVState *env =3D cpu-&gt;env_ptr;</pre><pr=
e>+    uint64_t stateen =3D env-&gt;mstateen[index];</pre><pre>+</pre><pre>=
+    if (!ctx-&gt;cfg_ptr-&gt;ext_smstateen || env-&gt;priv =3D=3D PRV_M) {=
</pre><pre>+        return true;</pre><pre>+    }</pre><pre>+</pre><pre>+  =
  if (ctx-&gt;virt_enabled) {</pre><pre>+        stateen &amp;=3D env-&gt;h=
stateen[index];</pre><pre>+    }</pre><pre>+</pre><pre>+    if (env-&gt;pri=
v =3D=3D PRV_U &amp;&amp; has_ext(ctx, RVS)) {</pre><pre>+        stateen &=
amp;=3D env-&gt;sstateen[index];</pre><pre>+    }</pre><pre>+</pre><pre>+  =
  if (!(stateen &amp; SMSTATEEN0_FCSR)) {</pre><pre>+        if (ctx-&gt;vi=
rt_enabled) {</pre><pre>+            ctx-&gt;virt_inst_excp =3D true;</pre>=
<pre>+        }</pre>
        </blockquote>
        <pre>Are there any considerations for adding  virt_inst_excp instea=
d of</pre><pre>directly</pre><pre><br></pre><pre>"generate_exception(ctx, R=
ISCV_EXCP_VIRT_INSTRUCTION_FAULT)" here?</pre><pre><br></pre><pre>Regards,<=
/pre><pre><br></pre><pre>Weiwei Li</pre>
      </blockquote>
      <pre>I had considered it but I think this is a simpler approach as th=
e rest</pre><pre>of the code path stays the same as generating an illegal i=
nstruction</pre><pre>exception, for e.g setting the bins value (tval).</pre=
>
    </blockquote>
    <p>OK,&nbsp; we did need to set bins value for virt instruction
      exception. However I prefer directly call a <br>
    </p>
    <p>new gen_exception_virt function(similar to<span style=3D"color:
        #000000;"> gen_exception_illegal</span>) here.</p>
    <blockquote type=3D"cite" cite=3D"mid:d7c8fc4fc255a23850d78da6c937e57e8=
5ce09c7.camel@ventanamicro.com" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex">
      <pre> Also we need to</pre><pre>return true from all the caller trans=
_* functions even if the smstateen</pre><pre>check has failed.</pre>
    </blockquote>
    <p>False is returned when smstateen check fails currently.</p></blockqu=
ote><div>Yes, however if we make this change then should return true if the=
 check fails so that the decode_opc doesnt fall through and generate anothe=
r exception. It can be done but it would be contrary to the general convent=
ion.</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex">
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:d7c8fc4fc255a23850d78da6c937e57e8=
5ce09c7.camel@ventanamicro.com" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex">
     =20
      <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex">
       =20
        <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex">
          <pre>+        return false;</pre><pre>+    }</pre><pre>+</pre><pr=
e>+    return true;</pre><pre>+}</pre><pre>+#else</pre><pre>+#define smstat=
een_fcsr_check(ctx, index) (true)</pre><pre>+#endif</pre><pre>+</pre><pre>+=
#define REQUIRE_ZFINX_OR_F(ctx) do { \</pre><pre>+    if (!has_ext(ctx, RVF=
)) { \</pre><pre>+        if (!ctx-&gt;cfg_ptr-&gt;ext_zfinx) { \</pre><pre=
>+            return false; \</pre><pre>+        } \</pre><pre>+        if =
(!smstateen_fcsr_check(ctx, 0)) { \</pre><pre>+            return false; \<=
/pre><pre>+        } \</pre><pre>      } \</pre><pre>  } while (0)</pre><pr=
e>  </pre><pre>diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc</pre>=
<pre>b/target/riscv/insn_trans/trans_rvzfh.c.inc</pre><pre>index 5d07150cd0=
..6c2e338c0a 100644</pre><pre>--- a/target/riscv/insn_trans/trans_rvzfh.c.i=
nc</pre><pre>+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc</pre><pre>@@ -=
20,18 +20,27 @@</pre><pre>      if (!ctx-&gt;cfg_ptr-&gt;ext_zfh) {      \<=
/pre><pre>          return false;         \</pre><pre>      }              =
           \</pre><pre>+    if (!smstateen_fcsr_check(ctx, 0)) { \</pre><pr=
e>+        return false; \</pre><pre>+    } \</pre><pre>  } while (0)</pre>=
<pre>  </pre><pre>  #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \</pre><pre>    =
  if (!ctx-&gt;cfg_ptr-&gt;ext_zhinx &amp;&amp; !ctx-&gt;cfg_ptr-&gt;ext_zf=
h) { \</pre><pre>          return false;                  \</pre><pre>     =
 }                                  \</pre><pre>+    if (!smstateen_fcsr_ch=
eck(ctx, 0)) { \</pre><pre>+        return false; \</pre><pre>+    } \</pre=
><pre>  } while (0)</pre><pre>  </pre><pre>  #define REQUIRE_ZFH_OR_ZFHMIN(=
ctx) do {       \</pre><pre>      if (!(ctx-&gt;cfg_ptr-&gt;ext_zfh || ctx-=
&gt;cfg_ptr-&gt;ext_zfhmin)) { \</pre><pre>          return false;         =
                \</pre><pre>      }                                        =
 \</pre><pre>+    if (!smstateen_fcsr_check(ctx, 0)) { \</pre><pre>+       =
 return false; \</pre><pre>+    } \</pre><pre>  } while (0)</pre><pre>  </p=
re><pre>  #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \</p=
re><pre>@@ -39,6 +48,9 @@</pre><pre>            ctx-&gt;cfg_ptr-&gt;ext_zhi=
nx || ctx-&gt;cfg_ptr-&gt;ext_zhinxmin)) </pre><pre>{     \</pre><pre>     =
     return false;                                        \</pre><pre>     =
 }                                                        \</pre><pre>+    =
if (!smstateen_fcsr_check(ctx, 0)) { \</pre><pre>+        return false; \</=
pre><pre>+    } \</pre><pre>  } while (0)</pre><pre>  </pre><pre>  static b=
ool trans_flh(DisasContext *ctx, arg_flh *a)</pre>
        </blockquote>
      </blockquote>
    </blockquote>
 =20

</blockquote></body></html>

--=-ok35VPksaYy2IEbOXLos--


