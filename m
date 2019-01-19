Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkyWX-0008Cc-3h
	for mharc-qemu-riscv@gnu.org; Sat, 19 Jan 2019 16:51:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkyWV-0008CT-6t
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkyWU-0007Xz-FC
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:51:27 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gkyWM-0007Pn-D2
	for qemu-riscv@nongnu.org; Sat, 19 Jan 2019 16:51:22 -0500
Received: by mail-pg1-x542.google.com with SMTP id c25so7712589pgb.4
	for <qemu-riscv@nongnu.org>; Sat, 19 Jan 2019 13:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vAZXDjGZJbqRswuongkwXs2PO2pph4nZiBczz3GGrno=;
	b=ZDeSV07XzHvQUirz0FC5MAAPNLczXYKzKQnieJZZmgV0rNy/x6v84YYXTm5VnlMWyl
	1yBxzqzTENOUKeI7HQDsOsdNzPcvX8PQ6wrpcyzrkNphE/mGSmPN3b+DWXJkpYHu/kpo
	OtUY8Y98xgPabiQpw5BVeP0d24zZMvH8E7nrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vAZXDjGZJbqRswuongkwXs2PO2pph4nZiBczz3GGrno=;
	b=JvIhybj03lFtUBsiGOx2/DHnUDL/ipSnX2JanfHXeUXgf7zAr007T5leF3MRcmCbOb
	GGzR/FQRHcE9Hhxi3rwe20JgJBsCt02MKyaS3GD1984f8OSOm2UaKKY+TCGXfa8dP5Sn
	V7o4eQWe/E26ek987Qr9njAhDvKB+gNFuPC2FDIjij/D/cZkien9TL7L4xt/vKJ39huP
	1hlJmwUXuVZ7MiY/rVeFmcFZ9PXTpeyEyKgJp+5aRTsI2i7JTY10A9LXt/YwKjXaI/t7
	dbYLINdCqfapjL9rImYpyLu6m4ryI8/B9i9Pow3i1Ky1RXQimAXVjPlniZQo59Xe0ZdN
	OSPA==
X-Gm-Message-State: AJcUukftHrjI5AbKE+SLSa92NJxix1YdU665b5lVdGBQjmRzIqVAjOmn
	3hQ4oBUdWoNJia1WakIueqzhfg==
X-Google-Smtp-Source: ALg8bN7CcEut2t+QoccU5VeoJ1mWvDEx7YdT7qOKyzk2WsAH4gW9V3vdY9gTRpNQYUeJcoXaiMSDlg==
X-Received: by 2002:a63:1a4b:: with SMTP id a11mr22932826pgm.254.1547934671651;
	Sat, 19 Jan 2019 13:51:11 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	w128sm11299376pfw.79.2019.01.19.13.51.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 13:51:10 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org
References: <20190118131456.32451-1-kbastian@mail.uni-paderborn.de>
	<20190118131456.32451-13-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8eb4c646-4580-c2f0-653c-55a2350a6309@linaro.org>
Date: Sun, 20 Jan 2019 08:51:04 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190118131456.32451-13-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [PATCH v4 12/35] target/riscv: Convert RV32F insns
 to decodetree
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
X-List-Received-Date: Sat, 19 Jan 2019 21:51:28 -0000

On 1/19/19 12:14 AM, Bastian Koppelmann wrote:
> +static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
> +{
> +    REQUIRE_FPU;
> +    if (a->rs1 == a->rs2) { /* FNEG */
> +        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT32_MIN);
> +    } else {
> +        TCGv_i64 t0 = tcg_temp_new_i64();
> +        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
> +        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 31);
> +        tcg_temp_free_i64(t0);
> +    }
> +    return true;
> +}
> +
> +static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
> +{
> +    REQUIRE_FPU;
> +    if (a->rs1 == a->rs2) { /* FABS */
> +        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT32_MIN);

Not an issue with this patch set, since you are just moving existing code.

However, while I'm thinking about it:

It just occured to me that these uses of INT32_MIN are not ideal, in that they
are (signed) -0x80000000 and not 0x0000000080000000ull.

In particular, FNEG will remove the NaN-box of the 32-bit value.

Similarly with the construction of fsgnjn_s wrt not + deposit.  It might be
better to simply xor the sign bit rather than not the whole 64-bit value.

Have you tried using RISU to compare these sorts of results vs real hardware,
or spike?


r~

