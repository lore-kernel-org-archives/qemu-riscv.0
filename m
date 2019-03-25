Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8SwR-0006Wd-DA
	for mharc-qemu-riscv@gnu.org; Mon, 25 Mar 2019 12:59:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h8SwO-0006U6-T2
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 12:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h8SwL-0003qG-2z
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 12:59:16 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h8SwJ-0003o6-Dq
	for qemu-riscv@nongnu.org; Mon, 25 Mar 2019 12:59:12 -0400
Received: by mail-pl1-x642.google.com with SMTP id bg8so230770plb.0
	for <qemu-riscv@nongnu.org>; Mon, 25 Mar 2019 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=a5ZedghKB5WDlCS7hZqwi6ZQO4obLH3TjCTaRFDUGQ4=;
	b=t0xb+D4D4DAD7A7jQuyHtBsOYHmojphjQ9DDCxf72CX5fcpw4jYunVkftqG2zJWZ1L
	5672sAvVyPYPr9eXMWN7B7FGgMBdGMmyYPe0NtosaPZV8unRUmJq3s3G1zC8GBfCyjcV
	2sibZ2pQRcfgcAsu/MArvkDenLVpqfZsaSSe6XelRIZzti9TQKot8KOwPK2KF0HswnP/
	F6upaum/sOT13Hrt/ANSb/JT2OoRjIv5+iqk5WERuHbWBQQ5yC1n0zONWs021fUkAIdu
	y3/Nh8HoDIn2F2qkJKwWsdCLV8bc16ZHQxBiZx8xA4M/JM7l5dHNPDFfa5XHxjxE7wcv
	BFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=a5ZedghKB5WDlCS7hZqwi6ZQO4obLH3TjCTaRFDUGQ4=;
	b=Pcf2c2SNUM6cGnJRYTU7QWjuxRlGnwQlb9SmM09ONZxPnspv+ne3i4hDdt4oNpASIY
	s5IDh37+61O4rLSHcjv62a0ACBE/E5s6Z3azvwlCcEwj9e4iMwC3f8nEQrQBwiB7oWu+
	SqsMGyLpZNP2sdBb8SB1Bpb57JpOvRpp9hajqaPGDzHk/mnmCgzw9oQNekD5QaYKasRD
	fHr21a5iAHnE7BwiuCxfQBECOoL9qBcJT1haeLsdGcg33MC6dKdiCEc40j2RS8eA+Eua
	0FRPkHtkeHx1rgMxcsCmQq/Fa9L25YkFub4G3ps9a8DO7jdak9upeyrSPeTU11/wB5xQ
	auww==
X-Gm-Message-State: APjAAAV/yk9dQdeBi5YQR7Cwsdy8I5kvGD+MQ0rAUfBHDgPsM5yyPv5d
	fEs2dHC9yTWj9WCK6kf1JHILvg==
X-Google-Smtp-Source: APXvYqwZnXReFj1DrvsKgmjcR4GVDnlar7HvEOxfbiJ7eO5SATWBBbGzQnZ0H91GRPXUIFl6pnahQg==
X-Received: by 2002:a17:902:9683:: with SMTP id
	n3mr26560575plp.333.1553533149834; 
	Mon, 25 Mar 2019 09:59:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-5-201.tukw.qwest.net. [174.21.5.201])
	by smtp.gmail.com with ESMTPSA id
	d69sm13302663pfg.26.2019.03.25.09.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 09:59:09 -0700 (PDT)
To: Fabien Chouteau <chouteau@adacore.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20190325114554.7388-1-chouteau@adacore.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7b79d668-fffb-35ed-b855-e27eab819a05@linaro.org>
Date: Mon, 25 Mar 2019 09:59:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190325114554.7388-1-chouteau@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [PATCH V2] RISC-V: fix single stepping over ret
 and other branching instructions
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
X-List-Received-Date: Mon, 25 Mar 2019 16:59:17 -0000

On 3/25/19 4:45 AM, Fabien Chouteau wrote:
> This patch introduces wrappers around the tcg_gen_exit_tb() and
> tcg_gen_lookup_and_goto_ptr() functions that handle single stepping,
> i.e. call gen_exception_debug() when single stepping is enabled.
> 
> Theses functions are then used instead of the originals, bringing single
> stepping handling in places where it was previously ignored such as jalr
> and system branch instructions (ecall, mret, sret, etc.).
> 
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  .../riscv/insn_trans/trans_privileged.inc.c   |  8 ++---
>  target/riscv/insn_trans/trans_rvi.inc.c       |  6 ++--
>  target/riscv/translate.c                      | 30 +++++++++++++++----
>  3 files changed, 32 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

