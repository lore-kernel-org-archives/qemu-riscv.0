Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS5df-0006j5-OO
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 14:36:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5dd-0006fY-Ul
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:36:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5da-00078y-Qc
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:36:45 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS5da-00077R-LT
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:36:42 -0500
Received: by mail-pl1-x636.google.com with SMTP id a14so17854636plm.12
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 11:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oZ0r4ol6CCWtfspfh+KkTyfsoihbnd7WMq4KYAudGNI=;
	b=Mu1HPV08+FaBlV+d3m7uuKjmCXnvrQm35GPowPEHjw3Qsbgx5P4+Ln+w56NzZHbDPy
	2nOgaSF+jBMtYjZ+2ioxv3wqTCRGCVCt0OoY69QcD9um53KjvkmEBouFojjEovL/rGNy
	98cOufPkfsPY+/XCX2cjlA61g1dFTutUmIjcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oZ0r4ol6CCWtfspfh+KkTyfsoihbnd7WMq4KYAudGNI=;
	b=cq+zooGuuf5iQIyRH8NkFEW6Xx20K38jNYKZ3lOCgpGqfg3I1yOnKAovaNUU7hhbua
	KgY5w60lgNuc4Ot4pR9xggCIoSoXNyQFVy9PW2CW/9jaC3Gniq5oKG3OhcqeoQRxJwxy
	OIew2D/4X/3UZkhIfULQYoIVlmLpWGazHYpiAuYjJYD21Y8Qm1VRflrQaYU7XSImcmre
	vpizITzGNKkBmsE/eeWY1YXO15vxdlRQ+dd8vkt0MYtQsOjvkgegBcvL7PL59V24DGqV
	pEXoyv7ypbEdIrmEyus0t9LFUq2nurnyWqvs26I7+Y5dFIjIItrKVhOHpABr0MyIrFJa
	GaYQ==
X-Gm-Message-State: AA+aEWYHp0EBg1BS/bdjRQ5dTi3jhsjYGe2uWugDiPOcml5PTfHHl2NE
	OXOWwnC0vCdgXddy3o9YFHsxPg==
X-Google-Smtp-Source: AFSGD/WCKYlQkQOHlK9UzGCd0wWv+HGwtrPrvav+KobIZy72JQSutWRPPU26aPG5kUZxYX07sigNug==
X-Received: by 2002:a17:902:76ca:: with SMTP id
	j10mr37077289plt.144.1543433801346; 
	Wed, 28 Nov 2018 11:36:41 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180])
	by smtp.gmail.com with ESMTPSA id h69sm8390423pge.4.2018.11.28.11.36.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 11:36:40 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<0ee380a9ce2d7290523b5d06597c74ea14ff4174.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d9994150-7232-638a-3519-830544604cac@linaro.org>
Date: Wed, 28 Nov 2018 11:36:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <0ee380a9ce2d7290523b5d06597c74ea14ff4174.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: Re: [Qemu-riscv] [RFC v2 08/24] riscv: tcg-target: Add the
 immediate encoders
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
X-List-Received-Date: Wed, 28 Nov 2018 19:36:46 -0000

On 11/27/18 1:07 PM, Alistair Francis wrote:
> +void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
> +                              uintptr_t addr)
> +{
> +    intptr_t offset = (intptr_t)addr - (intptr_t)jmp_addr;
> +    tcg_debug_assert(offset == (int32_t)offset);
> +
> +    int32_t hi20 = ((offset + 0x800) >> 12) << 12;
> +    int32_t lo12 = offset - hi20;
> +
> +    atomic_set((uint32_t *)jmp_addr, encode_uimm20(hi20));
> +    atomic_set((uint32_t *)jmp_addr + 4, encode_imm12(lo12));
> +
> +    flush_icache_range(jmp_addr, jmp_addr + 8);
> +}

Two atomic_sets do not help.  You want a single 64-bit atomic_set updating both
insns simultaneously.  But since you're currently setting

> +#define TCG_TARGET_HAS_direct_jump      0

this code isn't used at all.  Better to simply remove it for now.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

