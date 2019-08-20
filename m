Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0Adq-0003Gr-Ml
	for mharc-qemu-riscv@gnu.org; Tue, 20 Aug 2019 16:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0Ado-0003GI-Ht
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 16:22:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0Adn-0004gt-AX
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 16:22:04 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46040)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0Adn-0004g6-22
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2019 16:22:03 -0400
Received: by mail-pg1-x541.google.com with SMTP id o13so3842920pgp.12
 for <qemu-riscv@nongnu.org>; Tue, 20 Aug 2019 13:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qw9rSGk3vTZ3Vdf5mR691iEN/t8wlN6qDZ1nCHiADYU=;
 b=MQGOJhxmi7BBB8TxdV39I9CxsykmDmtv5R/8lyRU+ckwwUdDnv2ZR8I7k1lYxt84L3
 S3zv1gEg3oYt29U2q4m7jwoFyn8lQV3YOpJyySFY5DTW0AroK07zJRfL1AUDz+HAiLGk
 S5ML6hTqoKTDH0xAXvBwX/s8OENKZjHPpNTGYUgqDpJI5H0XPKNZTvgbSgEUDU4XPOMG
 OK9uP7mx2LvK3C121rjfl5iZ/dEqHt/x/pqUIhYeYodxxNSIX18PHJDiYY0PQY0dgt2r
 bxf/pklqo36Xq9gesmKqtouWg3sZt08+EMkmld9ma38f6CFSN1s6rvyQAguhRd2PY43J
 1J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qw9rSGk3vTZ3Vdf5mR691iEN/t8wlN6qDZ1nCHiADYU=;
 b=mAmUxTxK7jlXfLVTy1kGnn4vjKJHanQF7jFGHY+wvWAGPJZ0H12q7ghOHo+iG4W/jc
 MyBPtywJMkfqj4s5z0eBzRatURBNbZ1loKiIezDnW7Zb1v9Rvye+W0rVfCzyOtF8Eo54
 53nq4F0iz7lWriLPk3CxfFOMztIYXXNFzwrXq14r1thxBYGzHEd2m5T5LHW27gjm7M63
 JMRpuRQ6YZsXZLJ/tlKYSQkgmbU4pPGB9r+TbAryiqxm2RW+396wCdNC5i26Xo0mqhu4
 84J9Nz2//Q9k89UxdkyWaNWt01Z1GU3t5c7p7xGGCTmv9JLZDxWiZRJrdmJGZ+D/GEK1
 8+nw==
X-Gm-Message-State: APjAAAWO/5/2/hNuEZvq/CWNNIOj0mZL36ijJlBD6CEWwo34zNXN4oNb
 /Q/Bek5IIN0qL2p9oPX/TprdBg==
X-Google-Smtp-Source: APXvYqyAykS2iNKEtbWEtdBLIr14XVrpFPRhaooL2nokWWJ0nN0bkwsdp140aq+Gm9N3uFNL59TH2Q==
X-Received: by 2002:a65:62cd:: with SMTP id m13mr26089517pgv.437.1566332521964; 
 Tue, 20 Aug 2019 13:22:01 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a11sm726440pju.2.2019.08.20.13.22.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2019 13:22:01 -0700 (PDT)
To: Jim Wilson <jimw@sifive.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20190820143942.17371-1-georg.kotheimer@kernkonzept.com>
 <79a82be5-38a2-edeb-66a6-25d34246aea3@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cb6758b2-966f-2584-81db-8e4d499eabec@linaro.org>
Date: Tue, 20 Aug 2019 13:21:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <79a82be5-38a2-edeb-66a6-25d34246aea3@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2] RISC-V: Select FPU gdb xml
 file based on the supported extensions
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
X-List-Received-Date: Tue, 20 Aug 2019 20:22:05 -0000

On 8/20/19 1:06 PM, Jim Wilson wrote:
> I don't see a need to remove the fp csr's from the csr list.  There are other
> extension dependent CSRs, like hypervisor ones. I think it makes more sense for
> the csr list to contain all of the csrs, and then disable access to them if
> that extension is not enabled.  If there is a good reason to require changes to
> the csr XML files, then it probably should be discussed with the gdb developers
> too, so that the gdb and qemu copies of the files remain consistent.

Another possibility is to generate the list of csr's at runtime and export that
to the connecting gdb.

We do this in target/arm/gdbstub.c, arm_gen_dynamic_xml.


r~

