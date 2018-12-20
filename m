Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZrMv-0000eK-H9
	for mharc-qemu-riscv@gnu.org; Thu, 20 Dec 2018 00:59:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gZrMt-0000dX-8B
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 00:59:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gZrMp-0003Qa-LU
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 00:59:34 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46949)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gZrMp-0003Nq-BW
	for qemu-riscv@nongnu.org; Thu, 20 Dec 2018 00:59:31 -0500
Received: by mail-pg1-x543.google.com with SMTP id w7so345116pgp.13
	for <qemu-riscv@nongnu.org>; Wed, 19 Dec 2018 21:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wfMVs8xQ5zMPvWXefQBdW7rSuHVIRIKBBBPTU2lD+3g=;
	b=k2SF6XzOn/aDuu/E6zvKd0zLwxDyWNuLlDJ4sEDWA7DZbGlXEY6EBBLy8QEUk/68dF
	9GO5/s+4K9EehoRWk60g1UtTuZRB1Nu6fluaNM65/gHNtISFpeTRWT86rIoyeX81bWSJ
	Q/1zeFl3n9JkCdnUO8CkJikTrLJQEIhHBxdJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wfMVs8xQ5zMPvWXefQBdW7rSuHVIRIKBBBPTU2lD+3g=;
	b=FgRAwVI/GEHOq4F08X2UJPtlAsscQErtx5IAlJGAxigusegtZJ23FeoUJo7m2ojPfU
	h0C256IavjWXpmWtIhBMum0DH55iF/UeHQiXeXX5+LGjwzXWJ/YiZzUVM8GgR+8dT+qn
	1ISOpAN6oLo9y/CpKGml4Nu2ErsauHmFYprvbQTYIR0ZNJfLPw9vvAvuMMBR+k0AziYr
	wr/bx9H0dXXMAVRUUTILPOy9nps0teyqhCqEsbTEJAkDknL9UfvHNMOI6tQRCx0gscfd
	vZt+8GulugiIx8ora4hLturWUHkhmXk2oeCKmCIWjMF8fxD0XFJYqlZVB9OCK8uEvw/+
	ZcJw==
X-Gm-Message-State: AA+aEWZEjUxhLkvWs0tfpsewR7IEVdWaZVMPatdm19jmYNZdNf6c24Cf
	NzKMMumcVOWFcq5t7UfWChpmlw==
X-Google-Smtp-Source: AFSGD/XaG4C1fKJuD8JvN9+VpChY6sXqPoWBfUOWxeqXsgWfXZKsyIEjD8v7SOHZnBuL10DZNJaTwQ==
X-Received: by 2002:a62:6b41:: with SMTP id g62mr4656847pfc.13.1545285570180; 
	Wed, 19 Dec 2018 21:59:30 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	m85sm30189299pfj.171.2018.12.19.21.59.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 21:59:29 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
	<7c47f00cb4a9a777120456e0704b4076a5d943ab.1545246859.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2c5943dd-f23f-ecda-13a5-7e522336b735@linaro.org>
Date: Wed, 19 Dec 2018 21:59:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <7c47f00cb4a9a777120456e0704b4076a5d943ab.1545246859.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [PATCH v2 18/23] riscv: tcg-target: Add the out op
 decoder
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
X-List-Received-Date: Thu, 20 Dec 2018 05:59:36 -0000

On 12/19/18 11:19 AM, Alistair Francis wrote:
> +    case INDEX_op_ext32s_i64:
> +    case INDEX_op_extrl_i64_i32:
> +    case INDEX_op_extrh_i64_i32:
> +    case INDEX_op_ext_i32_i64:
> +        tcg_out_ext32s(s, a0, a1);
> +        break;

This is the last bug that's easy to identify.  It shows up quickly in a
linux-user smoke test [1].  Obviously extrl (extract low) and extrh (extract
high) should not be implemented identically.

Fixed thus.

With this, most of the tests pass, when run in a qemu-riscv chroot.  The ones
that don't primarily never get started.  E.g. the alpha test fails to map
ld.so, for reasons that I have not examined, since it's not a tcg problem.


r~


[1] https://archive.li/o/1YduE/wiki.qemu.org/download/linux-user-test-0.3.tar.gz


---
 tcg/riscv/tcg-target.inc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index f718542d63..6cf8de32b5 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1614,11 +1614,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,

     case INDEX_op_ext32s_i64:
     case INDEX_op_extrl_i64_i32:
-    case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
         break;

+    case INDEX_op_extrh_i64_i32:
+        tcg_out_opc_imm(s, OPC_SRAI, a0, a1, 32);
+        break;
+
     case INDEX_op_mulsh_i32:
     case INDEX_op_mulsh_i64:
         tcg_out_opc_reg(s, OPC_MULH, a0, a1, a2);
---

