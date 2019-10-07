Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHSd6-0001aJ-E8
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 09:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHSd3-0001a3-TI
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 09:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHScz-0006n6-22
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 09:00:45 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:36460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHScy-0006me-PF
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 09:00:40 -0400
Received: by mail-yb1-xb44.google.com with SMTP id r2so4625423ybg.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Oct 2019 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GW/+5oU8vcpueLiQ+EPc7ZItOROJfOToAgvJYJDHTic=;
 b=hmSU1FFV9EnrljpVyaOu2ZleTeuyJThhVjBoQsDmDtAtA9v2az5QukbXiGuxzFYze4
 L45wZXenumepomPrEKhuo4NhdCC3Inkv/ARN4UIZGyvuzDrGo2J2fm+k7cokgHLiR//e
 pQ4vU0pR5C3z4ZB/mVZSBB+irub0akzmYUcy4bPR9ntdD072EyYXlCCPHlg0aC5pvwWq
 umRpQpptXkz9+6lUVz5Pq7s/l5VSFhC5zkojvvnINh45Y51wAjEhrn7YoYRYKNhp+gaT
 qfo9JNWzidenhwAIIgNK7CnlVvLoUQJrSLSlwpMeAcxk9OwSwXMO6xLc4nOI5EtWGk/H
 qe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GW/+5oU8vcpueLiQ+EPc7ZItOROJfOToAgvJYJDHTic=;
 b=aGl9OacX6t3s5QZ5hvm+AdvxIY3bsFCL5knvLJbb1AxtedsLYtyMOVSVXLyAm27wR/
 08DwuJoCUYRkJU2T3/8DFmSfGVZ4mDA4dGncfTDKazTi3IHYQuek8WnQNXxPQ3+8OX4n
 shk01iNaaWX3PoG7vTs+5q+T0elyRqQx78TeuBu9qItmMECc7wTSYrTMB7xEbzFygbu1
 w8tTCswN0aQfbqinjv+F1qvLguSOWBwstUznf7cxMeNQSURuJLR/plGUDX4KwAm1N8Us
 dyh2uX1sdsyYzRljZQgNSP/aa9C8kLK+f/C84KGwexIyQbY48W7FDUFVxFuf3aYVyqRW
 1LSg==
X-Gm-Message-State: APjAAAXT/DCc/eSgE7DbhcVQ1G+vcX0jk9SQZmybX/JSiJ9OffEOeUtz
 Q65IHdIceBhruF+L854dVf0VtQ==
X-Google-Smtp-Source: APXvYqwFdiAd9Cm1URGBXWdiO5w7Lg4WzEfNycrLcW6B2uybDknfrrpZHnZ+xKBtjTnGh+NnEKpisQ==
X-Received: by 2002:a25:6ec4:: with SMTP id
 j187mr10621537ybc.331.1570453239024; 
 Mon, 07 Oct 2019 06:00:39 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id y205sm3790370ywc.6.2019.10.07.06.00.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 06:00:38 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
To: Dayeol Lee <dayeol@berkeley.edu>, qemu-devel@nongnu.org
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20191007052813.25814-1-dayeol@berkeley.edu>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5583387c-5c5b-8890-999b-2ba4d75cd69d@linaro.org>
Date: Mon, 7 Oct 2019 09:00:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007052813.25814-1-dayeol@berkeley.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
X-List-Received-Date: Mon, 07 Oct 2019 13:00:47 -0000

On 10/6/19 10:28 PM, Dayeol Lee wrote:
> riscv_cpu_tlb_fill() uses the `size` parameter to check PMP violation
> using pmp_hart_has_privs().
> However, the size passed from tlb_fill(), which is called by
> get_page_addr_code(), is always a hard-coded value 0.
> This causes a false PMP violation if the instruction presents on a
> PMP boundary.
> 
> In order to fix, simply correct the size to 4 if the access_type is
> MMU_INST_FETCH.

That's not correct.

In general, size 0 means "unknown size".  In this case, the one tlb lookup is
going to be used by lots of instructions -- everything that fits on the page.

If you want to support PMP on things that are not page boundaries, then you
will also have to call tlb_set_page with size != TARGET_PAGE_SIZE.

Fixing that will cause instructions within that page to be executed one at a
time, which also means they will be tlb_fill'd one at a time, which means that
you'll get the correct size value.

Which will be 2 or 4, depending on whether the configuration supports the
Compressed extension, and not just 4.


r~

