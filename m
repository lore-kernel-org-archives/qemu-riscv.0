Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA589CD98CE
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 07:29:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXwKS-0007Fi-I3; Fri, 12 Jun 2026 03:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXwKP-0007CM-9Z
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 03:29:22 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1wXwKN-0001Yh-Fw
 for qemu-riscv@nongnu.org; Fri, 12 Jun 2026 03:29:20 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-68c3421b009so2678102a12.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jun 2026 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1781249357; x=1781854157; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JbubdKVEEeVDhmtZ20UfxUpGZTQuBLzZdBV6ViDmMUY=;
 b=JG/BD62iIxdTcn7fykbFVqx8ftJtyxJkwgq2QtYn/l3kzpdSo0JpHC1KsBd/EDc/Lx
 5v33H9YCwRCD9QFADjsHyo/A92bcGIpT1Lwm8Dltu5o64xLa0LakgsGZBFNfLlMLUBri
 qaB97+eBW3xBB9aCH/Xr3qBgGB3SLO5FIXeD7kvOgZw48dhP329jfLoSfWxMNPCIOMjl
 b3Yg00k1WHRN5DWapZ/6RTZDL4Csz6DhKJc9tCI+YtRJH+HP19dWAYIQYuTtkEmjY3FC
 6TT8wqaY7JZJTdhm/O72Do1Kr2cDat+1CTsrZqJApGjMcZyWbwEhtvkfgaTV8abVM3YW
 s3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781249357; x=1781854157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbubdKVEEeVDhmtZ20UfxUpGZTQuBLzZdBV6ViDmMUY=;
 b=Ks9Kv7CKoi8ovXDQSiWc+wpFqp+vIKU0ilGweyuA1Ro8Ry0eNK7W4CfFk01wRZQZr0
 4NFAljeG45qFQ4u9P78fxjDTMYB+BaZXKIetXv+thBnexTjGcEhJ9SWVoe6jrmv1//eT
 La2AmS0LUw1JJgM/fqD0QPXZDdZT4seBs1uumYYR6iA4KCOh5f0UQqad4le3HV7ZZCch
 ppRKZf7FGpz4ypgHG16SbpP4mDJived5/HRWYULO3Vbthofkw4X+6uLnQllj4yMPUlzS
 tP1n9aAjdvfH1HFLtXGGwCYDL9Prl1scwj9yhT36SGGi5Pg9VPUsvnjBpWZEIJrbdHU8
 XvAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9IMkNC6D3uKpN/WwNchjqJDoNk2Ajlt2zMpxJsXm9oUrTbCl4/GkKafian3N0KOSy4KFppf+WpIlNP@nongnu.org
X-Gm-Message-State: AOJu0Yzx1OBxEs1A8bQAmcwGjs8XKtx8Uu/Ri90JGSOVqKU8UwJV2Me9
 LUMFQuGvbXEWB5lTpwgAwJvIeQBGTENMIToe7EnVqOwhTMK3ZUGgVN+EEMbCO/z3Vhs/nQiVCpK
 AzdT4P7W1raRuljZL5qscfz9RjcM4MQC8DNl6W0uwPxeGOSsmfiS1ND+2gMKVZv6OHn3i+XAx3X
 f+VSquijV29oLHtQgaYZB/dvtyCD9+T/OAv29xDCQT+YQ=
X-Gm-Gg: Acq92OEwNnTesgdb28g3KYlkmyLRV6G+4trGVKtyn8/URh+cbB6P1vtQntKK86gC8YU
 obRT4n4LOyUS85Ql6hSh50+UcbDA4Okom/ZDOUcBMSRiD2buhnfWGriWubfYZhyhAhXsorXX/Og
 D/bbS5btX+ATzjq0ICcFw2VE+xD7iBKkuJfAXoa2GA7PHvH0FRL8ebywQVHZN+vwSDQjRqQgMqv
 v3DusX53HISJI+2/Q1AzfRE3ET4WGng3UoAOFhGih5nG7IeBwrmRbaHdQKmR+PkCoPb6jM2+ibG
 7PU/svu2MMb+2jM2m9HzmdwzVdwTCGVn68FKgyCO8P9C4iRG2i3ZRL6dxEFONuIfptOs9gPF/3N
 C6T9Fm/mOh0olJTfpCGJIoZuc1Qx3jttQRf4CEG1blDkU7LRM6u/apypGeBCnqmWTUlM0OoXjhB
 m7YTnnQ9Bx15OML9JOD/aif1SYc3/lCaHtXcRJNUzRsnFw9dRCbr8OZ6tkeGYB
X-Received: by 2002:a05:6402:34c5:b0:670:d548:62a1 with SMTP id
 4fb4d7f45d1cf-69378d96d9emr615227a12.3.1781249357149; 
 Fri, 12 Jun 2026 00:29:17 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6937919b54asm296482a12.3.2026.06.12.00.29.14
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 00:29:15 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-68b90fc6a1dso1386401a12.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jun 2026 00:29:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+XBSguoRFwlOgDa+M6SEu1EO3c5BmLdHkVRdBWF9K827eg0lxIBX79Tt8T2KN4TNbHvST3FUQlAyhg@nongnu.org
X-Received: by 2002:a05:6402:44d7:b0:671:9dec:ba3 with SMTP id
 4fb4d7f45d1cf-69369d7b16emr703854a12.13.1781249354280; Fri, 12 Jun 2026
 00:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260318185238.99143-1-luisccunha8@gmail.com>
 <20260318185238.99143-4-luisccunha8@gmail.com>
In-Reply-To: <20260318185238.99143-4-luisccunha8@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Fri, 12 Jun 2026 15:29:02 +0800
X-Gmail-Original-Message-ID: <CAMXXpfabjF1SFFj+C=95WRWmdB2c_ejk6wy8pO6=t3ko+n+THw@mail.gmail.com>
X-Gm-Features: AVVi8CdjqQ3aRn_07XLDSXGaNUTL5UDewtCpjISEYsbe4-TVb3Hdi4zrOMVcB2Q
Message-ID: <CAMXXpfabjF1SFFj+C=95WRWmdB2c_ejk6wy8pO6=t3ko+n+THw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] target/riscv: Implement extension for Sharing
 Hardware Resources (Smpmpdeleg)
To: luisccc <luisccunha8@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="00000000000004b6040654096f69"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x529.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--00000000000004b6040654096f69
Content-Type: text/plain; charset="UTF-8"

>
>      pmp_unlock_entries(env);
> +
> +    /* Is SPMP enabled? */
> +    if (riscv_cpu_cfg(env)->spmp) {
> +        env->mpmpdeleg = MPMP_DELEG_DEFAULT;
> +        env->spmp_state.num_deleg_rules = 64 - MPMP_DELEG_DEFAULT;
>
Can we replace the const number with a macro?

+        spmp_unlock_entries(env);
> +    }
>  #else
>      env->priv = PRV_U;
>      env->senvcfg = 0;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c265098324..e19c1216ea 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -179,6 +179,7 @@ extern RISCVCPUImpliedExtsRule
> *riscv_multi_ext_implied_rules[];
>  #define MIN_RISCV_PMP_GRANULARITY 4
>
>  #define MAX_RISCV_SPMPS (64)
> +#define MPMP_DELEG_DEFAULT (64)
>
Why do we need MPMP_DELEG_DEFAULT?
Since SPMP and PMP share the same PMP entries, maybe we can directly use
MAX_RISCV_PMPS instead?

+/* S-mode Physical Memory Protection */
> +static RISCVException rmw_mpmpdeleg(CPURISCVState *env, int csrno,
> +                                    target_ulong *ret_val,
> +                                    target_ulong new_val, target_ulong
> wr_mask)
> +{
> +    uint16_t new_mpmpdeleg = (env->mpmpdeleg & ~wr_mask) | (new_val &
> wr_mask);
> +
> +    if (ret_val) {
> +        *ret_val = env->mpmpdeleg;
> +    }
> +
> +    /*
> +     * pmpnum is locked if MSECCFG_MML is set
> +     * and if new_mpmpdeleg is higher than last locked rule
> +     */
> +    if (!(env->mseccfg & MSECCFG_MML) &&
> +        (new_mpmpdeleg & 0x7F) > env->pmp_state.last_locked_rule) {
> +        env->mpmpdeleg = new_mpmpdeleg & 0x7F;
> +    }
> +
> +    env->spmp_state.num_deleg_rules = MPMP_DELEG_DEFAULT - env->mpmpdeleg;
> +    return RISCV_EXCP_NONE;
> +}
> +
>
Do we need to flush tlb here ?

--00000000000004b6040654096f69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =C2=A0pmp_unlock_ent=
ries(env);<br>
+<br>
+=C2=A0 =C2=A0 /* Is SPMP enabled? */<br>
+=C2=A0 =C2=A0 if (riscv_cpu_cfg(env)-&gt;spmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mpmpdeleg =3D MPMP_DELEG_DEFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;spmp_state.num_deleg_rules =3D 64 - MP=
MP_DELEG_DEFAULT;<br></blockquote><div>Can we replace the const number with=
 a macro?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 spmp_unlock_entries(env);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;priv =3D PRV_U;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;senvcfg =3D 0;<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index c265098324..e19c1216ea 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -179,6 +179,7 @@ extern RISCVCPUImpliedExtsRule *riscv_multi_ext_implied=
_rules[];<br>
=C2=A0#define MIN_RISCV_PMP_GRANULARITY 4<br>
<br>
=C2=A0#define MAX_RISCV_SPMPS (64)<br>
+#define MPMP_DELEG_DEFAULT (64)<br></blockquote><div>Why do we need MPMP_D=
ELEG_DEFAULT?<br>Since SPMP and PMP share the same PMP entries, maybe we ca=
n directly use MAX_RISCV_PMPS instead?</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+/* S-mode Physical Memory Protection */<br>
+static RISCVException rmw_mpmpdeleg(CPURISCVState *env, int csrno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *ret_val,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong new_val, =
target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t new_mpmpdeleg =3D (env-&gt;mpmpdeleg &amp; ~wr_mask=
) | (new_val &amp; wr_mask);<br>
+<br>
+=C2=A0 =C2=A0 if (ret_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret_val =3D env-&gt;mpmpdeleg;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* pmpnum is locked if MSECCFG_MML is set<br>
+=C2=A0 =C2=A0 =C2=A0* and if new_mpmpdeleg is higher than last locked rule=
<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!(env-&gt;mseccfg &amp; MSECCFG_MML) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (new_mpmpdeleg &amp; 0x7F) &gt; env-&gt;pmp_st=
ate.last_locked_rule) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mpmpdeleg =3D new_mpmpdeleg &amp; 0x7F=
;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 env-&gt;spmp_state.num_deleg_rules =3D MPMP_DELEG_DEFAULT - =
env-&gt;mpmpdeleg;<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br></blockquote><div>Do we need to flush tlb here ?</div></div></div>

--00000000000004b6040654096f69--

