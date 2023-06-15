Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FA6EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 12:58:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9mYN-0007j6-1N; Thu, 15 Jun 2023 08:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q9mYM-0007iq-Hf
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 08:58:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1q9mYK-0005iD-CL
 for qemu-riscv@nongnu.org; Thu, 15 Jun 2023 08:58:18 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so7600748f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 15 Jun 2023 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686833894; x=1689425894; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LRzh51+4ZLcW0C37vuin+uAT5EbtMs9l5mZLom2bfqA=;
 b=XO0wc1i90Ahbo+/ZlcOJgKshA4CumA3ZEPW7naBHmiVCpsXXnTtkLBn44nUXu6dDWJ
 c9pA7wumnlXhLzu3ayV8JkmtBGMUxiUylzefcyXarckVHn5V2gOHEb+fX3oLbyJ3JcCe
 w70ODpgmxS1wynmbTBSAiQGGCSjvm1eJ+7xqA83B7ayz74zeG/ygzn7fsClpZ4vxDfc9
 Ug3TXlKBSteNrsH2ic0chqilv7uUKsQw0GhIC/ifa0JxXOPQpY8tQSJcFl2prjZQQqPX
 69WpR7a2dMmh2wiHyE9IDHL3DNbpFNc33FHA/9r0XYe8pmDpNIlg/tbtd9Hq+rdb4Y2R
 NVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686833894; x=1689425894;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LRzh51+4ZLcW0C37vuin+uAT5EbtMs9l5mZLom2bfqA=;
 b=F+VBfXQak1cRP2ye53qd0OoQD8kgdX4WcGaTcia21D7gAWXqMAgQ1s8Ogu5ER6HmWE
 8giJ6OR9F/1VBBCFs6Q2ds7E3wKCby+B6NwerejZ0rTak+1ut/w09qkuCF+LEq6qBjt8
 rgeBcI5A0FhgT8QP8DAQlQshLop/V4izOv+smIEkKuMq5fqqQqBClnOAdWqFofsaVLlj
 +ZOIwF4Xs3yrl0IDgI6A2PW3FLp7I0Dt9WgU08TZBBQLAKHEboCboj0/mNK09TnW0sMf
 D1A55vrs3B1/dypPvHmqwKzvPMeowt3R40WuEtVajxh8iikQUPlHNhOCA8WdKinK3hCa
 lEnQ==
X-Gm-Message-State: AC+VfDw1PP3qfDtjy3T3dnWibJ01HXdOrroSHaKg0wCK+mna0IY+WCQa
 O6em+qEXpIU4SklC+9SQ+oxGxQ==
X-Google-Smtp-Source: ACHHUZ7/iO4b0ZJxkZVC+TlILlfTb74P5p7GdYBPgGbscrJsOf3luCXMiP8ILDfQ7spVlRUb/vlt5w==
X-Received: by 2002:adf:f050:0:b0:30f:c1ab:f72b with SMTP id
 t16-20020adff050000000b0030fc1abf72bmr11002159wro.62.1686833893895; 
 Thu, 15 Jun 2023 05:58:13 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a5d5143000000b0030fcda0508fsm7379976wrt.110.2023.06.15.05.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:58:13 -0700 (PDT)
Message-ID: <4b6274c6741baf435b5579f5a089c65997a8e0e6.camel@rivosinc.com>
Subject: Re: [PATCH v2 1/6] target/riscv: Add properties for BF16 extensions
From: Rob Bradford <rbradford@rivosinc.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Date: Thu, 15 Jun 2023 13:58:12 +0100
In-Reply-To: <20230615063302.102409-2-liweiwei@iscas.ac.cn>
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
 <20230615063302.102409-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.module_f38+16663+080ec715) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, 2023-06-15 at 14:32 +0800, Weiwei Li wrote:
> Add ext_zfbfmin/zvfbfmin/zvfbfwma properties.
> Add require check for BF16 extensions.
>=20
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
> =C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +++++++++++++++++++=
+
> =C2=A0target/riscv/cpu_cfg.h |=C2=A0 3 +++
> =C2=A02 files changed, 23 insertions(+)
>=20
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..dc6b2f72f6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1059,6 +1059,11 @@ void
> riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zfbfmin && !riscv_has_ext(env, RVF))=
 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zfbfmin ext=
ension depends on F
> extension");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 if (riscv_has_ext(env, RVD) && !riscv_has_ext(en=
v, RVF)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "D exte=
nsion requires F extension");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> @@ -1109,6 +1114,21 @@ void
> riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zfbfmin) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zvfbfmin ex=
tension depends on Zfbfmin
> extension");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zvfbfmin ex=
tension depends on Zve32f
> extension");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }

I don't think this is correct - from the spec:

"This extension [Zvfbfmin] depends on the Zfbfmin extension and either
the "V" extension or the Zve32f embedded vector extension."

So this should be:=20

+    if (cpu->cfg.ext_zvfbfmin && !(cpu->cfg.ext_zve32f || cpu-
>cfg.ext_v) {
+        error_setg(errp, "Zvfbfmin extension depends on Zve32f or V
extension");
+        return;
+    }

Cheers,

Rob

> +
> +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zvfbfwma && !cpu->cfg.ext_zvfbfmin) =
{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Zvfbfwma ex=
tension depends on Zvfbfmin
> extension");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Set the ISA extensions, checks should have ha=
ppened above */
> =C2=A0=C2=A0=C2=A0=C2=A0 if (cpu->cfg.ext_zhinx) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->cfg.ext_zhinxmin =
=3D true;
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..7d16f32720 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -75,6 +75,7 @@ struct RISCVCPUConfig {
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_svpbmt;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zdinx;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zawrs;
> +=C2=A0=C2=A0=C2=A0 bool ext_zfbfmin;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfh;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfhmin;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zfinx;
> @@ -84,6 +85,8 @@ struct RISCVCPUConfig {
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zve64f;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zve64d;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zmmul;
> +=C2=A0=C2=A0=C2=A0 bool ext_zvfbfmin;
> +=C2=A0=C2=A0=C2=A0 bool ext_zvfbfwma;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zvfh;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_zvfhmin;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_smaia;


