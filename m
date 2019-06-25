Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfmaL-0008Jt-TK
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 10:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47765)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hfmaJ-0008ET-Ab
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 10:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hfmaH-0006tc-C5
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 10:38:11 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46917)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hfmaG-0006fI-AW
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 10:38:09 -0400
Received: by mail-wr1-x441.google.com with SMTP id n4so18130219wrw.13
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XNc8byr0X7oATn/GXl4yJhUfNYcq99R2rU9eGSct7qk=;
 b=VamNt7ViCR7spmBHojRpr5NoYXCFqWu9vfvpvK16IislxdKrKjBzF3z7gPBgLlYJ3J
 SgDiLRGc9L0MnPDO0E5mcBZ3gr1wApi0rcQ7Gtq8PaRBuxfckKKMaCuih8+JBjmMHCZi
 LoiIkNctjLv8n3QTZJh3+o/A66OKjstHqMiASR6ZVr5pTmm1LHKgqRVmY2poGYmdLZbz
 UuC/XC6nbiWQKjXn88J5ZPpHUmEfyhk6n4aapNuFLslVN1DaxC2ohMLoLWPpdSxF1cGp
 zr1rkOsxZsxkjWP5D30HmEiyFchtj3YDOOhVhEA1wDSRQILQp9B9HLIqKoe86O2vrpMH
 8Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XNc8byr0X7oATn/GXl4yJhUfNYcq99R2rU9eGSct7qk=;
 b=lGseFbh62ag5/PmC7DeDdyc9MixsAfR4MiU9Xqgo1O94ly6cXI4NlyFUjMM8SKI2QX
 UX06VcuqB1T8E4aJfwaeayoCkbGPeOVzxHdxm5Ae/j4ByRl080MNnEPK36JjOwwn6lz8
 SEzYzmojMmJO0EmMhJYfetWMp0/PLHMFErnVB/VvrQ7AVpYfn/1hZXoT00ucC9oFQSEo
 9KxeOzMkKBPWjthQ+35RiDzH5WsotaihUyyDjniKmWz766yPK6pppmmzxyN2aHo4lbPL
 684IGzwBRs9j2gb4O+pE2SGX5znrr7Xd+nnJvGQNdEOq8zYfqViF7xphFKCCrtnaYAmA
 HNHw==
X-Gm-Message-State: APjAAAXxvgXmrg2oj5ZWIlfb/Kv1SsY5vZPIYiN3tQQgO+6g7Yo6uWmY
 lAfqxdbgKMAlEkyk2JajCL0sBw==
X-Google-Smtp-Source: APXvYqy/C2SXIUWOwTqWZJhwku0ILR7aqVtBKGArwRbuz4f/Gn4U8BWgPZryQZNxkMHfZTwKngVCNA==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr21942482wrn.281.1561473475677; 
 Tue, 25 Jun 2019 07:37:55 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id h14sm12476282wrs.66.2019.06.25.07.37.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 07:37:55 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@sifive.com, alistair23@gmail.com
References: <79729cc88ca509e08b5c4aa0aa8a52847af70c0f.1561039316.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0bcb1b80-8a22-4e2f-b761-f9297ceff8ec@linaro.org>
Date: Tue, 25 Jun 2019 16:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <79729cc88ca509e08b5c4aa0aa8a52847af70c0f.1561039316.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v1 1/1] tcg/riscv: Fix RISC-VH host build
 failure
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2019 14:38:12 -0000

On 6/20/19 4:04 PM, Alistair Francis wrote:
> Commit 269bd5d8 "cpu: Move the softmmu tlb to CPUNegativeOffsetState'
> broke the RISC-V host build as there are two variables that are used but
> not defined.
> 
> This patch renames the undefined variables mask_off and table_off to the
> existing (but unused) mask_ofs and table_ofs variables.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Oops.  Thanks, queued.


r~

