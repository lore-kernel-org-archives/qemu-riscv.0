Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGRwi-0006WW-Fq
	for mharc-qemu-riscv@gnu.org; Tue, 16 Apr 2019 13:32:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hGRwe-0006Vl-FG
	for qemu-riscv@nongnu.org; Tue, 16 Apr 2019 13:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hGRwd-0002mn-Ji
	for qemu-riscv@nongnu.org; Tue, 16 Apr 2019 13:32:32 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hGRwd-0002m9-D4
	for qemu-riscv@nongnu.org; Tue, 16 Apr 2019 13:32:31 -0400
Received: by mail-pg1-x541.google.com with SMTP id k3so10668741pga.6
	for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2019 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DZgxGGKLa0kE9VqJcscCmcCSakbkChpoYfz20lljoeQ=;
	b=l083H1G8ceMz3zTYuOKwzkSAYPpAaIZA1d67HLyohD9pXM0uVajyRQ2Z99FKYGGXYE
	lnmmny58VdF87YsY2FxDRmFHOI5b2walIkBCfcgJkxdTIVwB66oNbOoW+U0Y2vJoOw/0
	jHAUFX3+mLbN7+SQecALFEC+eVdSgIQWN5Jbd8UJcRsCBbAQNCP8aX07stU0qHrxJAFm
	tgjD3tSnYovyvfCPXEEfpGwGN/R/OIpX5pLsM0YKnFP0+JaPjT8I5IuhAnM4BLHgRVUV
	k0/QcEUR1ca6GLUNOOawhcNN40OK2gHH2oDRFztpER5L8A+bVjTpWyLSMVSTy0roR5D2
	kq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DZgxGGKLa0kE9VqJcscCmcCSakbkChpoYfz20lljoeQ=;
	b=gK88hNAk4OIiSH8EzkZalJzzi157ijcztP5jMKDsvXoNJa2guV1KcZdTXVEUnJtAfI
	KMe6B3OnYH8oAQNhES4EFwN0cLgi1n8J2HPDA369jV9Ar2DOnpZ98lTHqlUs1SP0euRW
	4OG37+ES8jnV4OW6CHZM/Io2KnDnU60XY8bEYgL0leBJWLVuuEC6fskY+Q1tpHK33BdA
	TOPtnbK5RohFoiEyGlZW2VjFu5oQWRRb0hcZ/q6ZlMxtMU/XQMZPV2jQCI0VFBIQ0bMN
	NcxkepbDzc3SjxrxgQCltjKRlr3slTjg91IVBepxVZXVpyF3cSrSx7W2jWjbecMl+zrg
	Ecgg==
X-Gm-Message-State: APjAAAVOVaEQh/i92HKvLgxQvhHjAgwvAbio12QhgByakAm1cF+Tffqd
	35bDDxaEDCESrQ3lyOMqeYKjpuJLSXs=
X-Google-Smtp-Source: APXvYqxDCZbpjR6FZOuWE1Yv+vM83LbE0aghRK0jo1whhe3Wwqc697VenAKo+zMYJ60Fcp2bG4nIsQ==
X-Received: by 2002:a63:8848:: with SMTP id l69mr73483641pgd.137.1555435949830;
	Tue, 16 Apr 2019 10:32:29 -0700 (PDT)
Received: from [172.20.101.138] (rrcs-66-91-136-155.west.biz.rr.com.
	[66.91.136.155]) by smtp.gmail.com with ESMTPSA id
	e126sm130574179pfh.35.2019.04.16.10.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 10:32:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: palmer@sifive.com, Alistair.Francis@wdc.com, qemu-riscv@nongnu.org
References: <20190401031155.21293-1-richard.henderson@linaro.org>
	<20190401031155.21293-4-richard.henderson@linaro.org>
	<c6b66db9-24d5-b55b-8b45-e73f3d7c3fba@mail.uni-paderborn.de>
	<50effb1c-3bbe-126b-9bfb-0b65eacc9c36@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <abdf9c63-8f27-8cb2-dc94-22318c3836ae@linaro.org>
Date: Tue, 16 Apr 2019 07:32:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <50effb1c-3bbe-126b-9bfb-0b65eacc9c36@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 3/8] target/riscv:
 Merge argument sets for insn32 and insn16
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2019 17:32:35 -0000

On 4/16/19 7:22 AM, Richard Henderson wrote:
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fb66e886bf..c96c616539 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -695,6 +695,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>   */
>  #pragma GCC diagnostic push
>  #pragma GCC diagnostic ignored "-Wredundant-decls"
> +#pragma GCC diagnostic ignored "-Wtypedef-redefinition"

Bah.  Of course gcc doesn't know this one.  And looking closer elsewhere, I see
we've got a configure test for the pragmas, which I suppose I ought to use.


r~


diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fb66e886bf..b62ca04281 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -693,12 +693,19 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
  * initially declared by the 32-bit decoder, which results in duplicate
  * declaration warnings.  Suppress them.
  */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wredundant-decls"
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
+# pragma GCC diagnostic push
+# pragma GCC diagnostic ignored "-Wredundant-decls"
+# ifdef __clang__
+#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
+# endif
+#endif

 #include "decode_insn16.inc.c"

-#pragma GCC diagnostic pop
+#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
+# pragma GCC diagnostic pop
+#endif

 static void decode_opc(DisasContext *ctx)
 {

