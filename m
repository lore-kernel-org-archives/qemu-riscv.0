Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNYq8-00008a-Qz
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:46:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYq6-00007X-1y
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYq2-0003sY-Nw
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:46:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51522)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNYq2-0003s6-Bc
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:46:50 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w7-v6so21051345wmc.1
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SU46t1x1MYfYftz/kXrs83EHDq/M/x5pbXxbx8wcD8I=;
	b=Q13WUDtmjlh05LAQnUoCZYST4cU8PKtd9VJAPjMkBb+sE5J1KM+PJlUrDWljiJXHTH
	hXKx8iglO+tu63jLa0H38w4AoXuaq6QfoGShjCCg66IrG97b1NU8cCpFnz48wjSKSWub
	XezoKzLI2J+KhnZy3FKPi6ZmraQf/qLgd6Gbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SU46t1x1MYfYftz/kXrs83EHDq/M/x5pbXxbx8wcD8I=;
	b=JpuUcxHn8ziPRJPqhA9XtwLnWivIWsa/OZ3isD6LFP2pXi8sre+FtMl7ddq8JjXs4y
	jpxMM9WvWSYRfHsQNB4zUdPjvvzinJuaRDbcw5fiY9OgceCTGOC44tQskjaAkP5got1c
	aAay/kjCQkHJ8hBqibfzlLFPnEzhL8FDWD2rnTLJPI0d7SHspoEougasTm22SVcsrte9
	XJnG/EhO1bxjfpBLGrkmIExVFwOoIXNToVJA5TkJRpqjik7ESApBF41ZQ+W7omdrqjAf
	1lUgmrqWn4PYSRVQBzTmrcoaVGm56M+ejIi8oxIyZ6O+HNMLU+PobJCooUdvTy/+LGcC
	HqKA==
X-Gm-Message-State: AGRZ1gLBsvZHm7ggvW5tu1WP0LvlvxkCLi7QuzOrbd0ypVAhlFbMNUsi
	PFaPwVXWJCV9C7Amb8WKLThK7w==
X-Google-Smtp-Source: AJdET5fPqO3ILPK5x4wDCkeyfxcpEZwZzXVrutN+5LkS4539vZruYxPcrAMMtV9h5VTfJn47w1Qu+g==
X-Received: by 2002:a1c:c46:: with SMTP id 67-v6mr1718102wmm.6.1542354408251; 
	Thu, 15 Nov 2018 23:46:48 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	j124-v6sm576200wmb.1.2018.11.15.23.46.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:46:47 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<35d983dbea36b3d8af70cc0055fc4136b476ace5.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <940d4f6d-7485-efc3-e5ad-c880548575ca@linaro.org>
Date: Fri, 16 Nov 2018 08:46:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <35d983dbea36b3d8af70cc0055fc4136b476ace5.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32f
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 01/23] elf.h: Add the RISCV
 ELF magic numbers
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
X-List-Received-Date: Fri, 16 Nov 2018 07:46:54 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  include/elf.h | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

