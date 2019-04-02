Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hB7FG-0006IE-Le
	for mharc-qemu-riscv@gnu.org; Mon, 01 Apr 2019 20:25:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hB7FE-0006Ei-SD
	for qemu-riscv@nongnu.org; Mon, 01 Apr 2019 20:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hB7FC-0003B5-Kn
	for qemu-riscv@nongnu.org; Mon, 01 Apr 2019 20:25:39 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hB7F8-00031h-76
	for qemu-riscv@nongnu.org; Mon, 01 Apr 2019 20:25:38 -0400
Received: by mail-pf1-x429.google.com with SMTP id z5so4380015pfn.3
	for <qemu-riscv@nongnu.org>; Mon, 01 Apr 2019 17:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=twVZk7dtbOnlrPvslKJoD7VAWoCIn9NbXLgbwYtQF6c=;
	b=MnyOm4xGQ5cGu1lMkRumMA2ZpqNEPyrcMrAvS3HXOS1ce0VobOJjNBBLhcQAxZDc4g
	G+xfPcEX6qk86ASc8m3NkJ3GSOOqjDqtubqrn8W3om2FdVhcLIeZ0DHY9Zk3mcl80ESA
	AT08cUPVZFXTeqYzQBfDzGg5YPB30UqJOlTvm8TGre38rzb2d4B+IsY1K2QWv/gGIH4a
	yM1a81EGisayXAhoipg+aDl3a2ACN6r/dy9BQjl6bCkcNxvEE2QDlIoLbDc17FphWIlg
	2oi9FhN7YbMN7g1n42NBCe4ysl+nEZDb8B6hof1FgxGDoXny3RInJ31uMTomqBwZjxJT
	3ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=twVZk7dtbOnlrPvslKJoD7VAWoCIn9NbXLgbwYtQF6c=;
	b=cxCkhNuRRXleQyNJpbpn0GtRgqWN0C3aAciq2BEL8d9lBB1TRASwSgJFaCiS9YUEWZ
	33QNl9PS1uXNhgU7UEPw7ILEFcaXMWVFOry2HDAQFIw0swGKNzPMrLi5ph39KlsQkceC
	54EkRftbaqJqDYOusQBwkB2F149xe4KwV5jUkQzoWViVOrovBWsZCIEeZFWX0b+CIxW+
	4BAbiyEL+8LdqVtZMx7nAZWWZJapN5+BQA+HRoemvIa78Y8nSNsUFm/xGJ73zOWYB95O
	b/B2BSF/jlprM5LRjHRBRTTU92cSE6kH6BOpBo2KpjVnjxr9/mmrT+F57uGZbZqUEHDw
	P+oA==
X-Gm-Message-State: APjAAAWC/vdEHzKaPKCzltb5ZaJR2muT7+Vj2V55UWUElGBlfREP7bEc
	/G1GRujf+vbkeq6gGvPWj9JJfg==
X-Google-Smtp-Source: APXvYqxtbyhreLoIJiNv9K6TTXzt/EgVnUxCk7nI82iZfv2RAJxvh7CvlTU+nKwvoQm0SPRVNgKyaQ==
X-Received: by 2002:a63:2015:: with SMTP id g21mr40412852pgg.226.1554164732872;
	Mon, 01 Apr 2019 17:25:32 -0700 (PDT)
Received: from [10.71.14.214] ([147.50.13.10])
	by smtp.gmail.com with ESMTPSA id
	10sm15527804pfh.14.2019.04.01.17.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 17:25:31 -0700 (PDT)
To: Jonathan Behrens <fintelia@gmail.com>, qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <CANnJOVHadZt5Vho5sy6FGVgUW_yvYZg7BGDiGJFtRBCquyOXZA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3b820a9d-a807-d3d9-b574-a6de2c5d29d1@linaro.org>
Date: Tue, 2 Apr 2019 07:25:25 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANnJOVHadZt5Vho5sy6FGVgUW_yvYZg7BGDiGJFtRBCquyOXZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Do not allow
 sfence.vma from user mode
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
X-List-Received-Date: Tue, 02 Apr 2019 00:25:41 -0000

On 4/2/19 2:12 AM, Jonathan Behrens wrote:
> The 'sfence.vma' instruction is privileged, and should only ever be allowed
> when executing in supervisor mode or higher.
> 
> Jonathan
> 
> Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
> ---
>  target/riscv/op_helper.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

