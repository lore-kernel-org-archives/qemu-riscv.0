Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmpd5-0000Fg-QL
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jan 2019 19:45:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmpd1-00005j-Qt
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmpUW-0000DI-VC
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:37:05 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gmpUW-0000Cx-Px
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:37:04 -0500
Received: by mail-pg1-x541.google.com with SMTP id v28so3417109pgk.10
	for <qemu-riscv@nongnu.org>; Thu, 24 Jan 2019 16:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=zgWNUyegB8Yo41E90wWza8C9e40/I27Se7w0pqRB2MM=;
	b=V9Cj3IAQmXNh8vuBs7WDMzBt+7Jxt820sOqf2IG058fu87AeX1BsnpK3u6oxdUAZaG
	Kl1J2E25DLY2XdDK1LhBD8qxzVH+cDbC9tIsFGSP0CIoga/KQldg+HdgwCl9ykIOB8sW
	FIMV+ufRq0bt6e1wOcJMDcwNfF2Iuz71rQoePdnLe7HeQTTqOKA1fCgMRq+1cNKyr04x
	3dzjgk76/Z9EUUk2mvHJ9IwgdEZ0foo/fzCv6DzHbiBJUOaSqbNKRSqZg2llIVxFZMBG
	Tb2UMB4wP39jyvuZn/bw5no1vP4Q9GRD1kXWNMx9Kw4jc/Vnyk7owBWt0TqzX38R2YfL
	/4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=zgWNUyegB8Yo41E90wWza8C9e40/I27Se7w0pqRB2MM=;
	b=BBzXCaCZL6b25CYF1mJ5b5w1w/kUDlx8PgYz7uO05f84NI9v/UsLU3D9/UxPbt/xEB
	mqHyRDqkRv1iHgc2uedkhw6PQmAFAqslasYAmd2Ov+JONGvvAdG/QbudMKJ5IbmIypTC
	KzDSrIcMV74kjMv7lW3JHDXIsS3rgcQuFBf6+eS7DjzR3YVBsCH8aiNIQ/cgzFrJQhXJ
	dFWN/vJfhdRBSTEdpFs6KMqCTxfrJJWGEXh6biF0tvk/eufzAf4HewLlYxPM5vDTtEaF
	uub9grIFJNAb35BbmHdM8pphWd/6RvCu86/AQKupstMnk0DQedWS+onJOaLW7Nwl/l8X
	VKQw==
X-Gm-Message-State: AJcUukd23NhRUWsImbRJMYiX30XvPj5qiSDJqhFun+EH36jUPCshSzNe
	p/anhkcnMouaFjXnuUgqvqzf9Q==
X-Google-Smtp-Source: ALg8bN57+1x3cCeAlksOMpOHXOVTefRDH2AVAIckL4VY4tvF3OOZ4vD5szR5MSzVq5DpBd7+4mU1JQ==
X-Received: by 2002:a62:8c11:: with SMTP id m17mr8727534pfd.224.1548376623700; 
	Thu, 24 Jan 2019 16:37:03 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	p6sm32622653pfn.53.2019.01.24.16.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 16:37:03 -0800 (PST)
Date: Thu, 24 Jan 2019 16:37:03 -0800 (PST)
X-Google-Original-Date: Thu, 24 Jan 2019 16:36:07 PST (-0800)
In-Reply-To: <cover.1547510220.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
	Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-1a177030-8a1a-450d-a3de-6e8c819dde12@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 0/8] Upstream RISC-V fork
 patches, part 3
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
X-List-Received-Date: Fri, 25 Jan 2019 00:45:52 -0000

On Mon, 14 Jan 2019 15:57:41 PST (-0800), Alistair Francis wrote:
>
> Alistair Francis (1):
>   RISC-V: Add priv_ver to DisasContext
>
> Michael Clark (5):
>   RISC-V: Implement mstatus.TSR/TW/TVM
>   RISC-V: Use riscv prefix consistently on cpu helpers
>   RISC-V: Add misa to DisasContext
>   RISC-V: Add misa.MAFD checks to translate
>   RISC-V: Add misa runtime write support
>
> Richard Henderson (2):
>   RISC-V: Split out mstatus_fs from tb_flags
>   RISC-V: Mark mstatus.fs dirty
>
>  linux-user/riscv/signal.c |   4 +-
>  target/riscv/cpu.c        |   2 +-
>  target/riscv/cpu.h        |  31 ++--
>  target/riscv/cpu_bits.h   |  11 ++
>  target/riscv/cpu_helper.c |  10 +-
>  target/riscv/csr.c        |  91 +++++++++---
>  target/riscv/fpu_helper.c |   6 +-
>  target/riscv/op_helper.c  |  47 ++++--
>  target/riscv/translate.c  | 292 ++++++++++++++++++++++++++++++++------
>  9 files changed, 388 insertions(+), 106 deletions(-)

Thanks.  Assuming that squash is OK I'll include these in my next PR, otherwise 
just send me a v2 and I'll swap them out.

