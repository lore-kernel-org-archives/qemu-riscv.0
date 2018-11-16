Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNYrf-0001Wa-7h
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 02:48:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYrd-0001UU-LB
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:48:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNYrb-0004OC-Lb
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:48:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNYrZ-0004JL-Q0
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 02:48:26 -0500
Received: by mail-wm1-x335.google.com with SMTP id p2-v6so20086468wmc.2
	for <qemu-riscv@nongnu.org>; Thu, 15 Nov 2018 23:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FSQm1INZtW+T7++6Lqj0PLpmNBgDCS2y4znBattf45M=;
	b=gN1TNy8W8A7lIoiO+9TnKyLINPUo4eMGi3XbV+M0nsoNHuQfeNPAOfChfZIyJTBhsO
	1ij4ZxeXnwtmT3friGabDvMHYOOqL9GyNuOKre6gsJsAi1gYabOLZ07mRq8hJPe5Cve/
	Jm6G4aG1SJ9GzOwwIGma2wHzAT9/GNwZZUPEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FSQm1INZtW+T7++6Lqj0PLpmNBgDCS2y4znBattf45M=;
	b=uVFnSc+YSIwCRmF9ZhB5VbrVxwSZib/a67X9DQnWf0MdLF2QJ2FxxfDd0qJwlJNyxb
	GuJznEAdvDD6xAU1z6r2EThpXvE3jy3fhtrLXNnAi//2V3DLfzKVcxNNDevm7PnIVi30
	DYKlvQLnosAwnaZOZWE5ELg0GiU2wedkRrfv4aAm9TvIth/Rgwhf//otaJh3XL27O2O8
	Xh1kYTFNIqv4KMj7knVbeNfgnuux6VJq9vuvX7msVPk8FY93GvqjjCMudgcLIMg4kSVo
	2G40qaBnmr0UgaZZSU+2HSae7REovmUClJ3oJyC/pSZq6qcW4iAKOQY4XaEktqUVeeAY
	yPbw==
X-Gm-Message-State: AGRZ1gKQD3oGfzfh9+t29Q7gWP8Ev+CRZnNvRdMUn7UnyUHxOKYeiZHa
	o5Ova2q7KuP/fwDqlOEEMZANlg==
X-Google-Smtp-Source: AJdET5dXlXIlrdBNOFhvPHmNydgPKvu2zHOo6MfSSG7eowJmuhHlAUfKXY9pWwQ3oZYaAodTXWfB7Q==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr268754wma.19.1542354489531;
	Thu, 15 Nov 2018 23:48:09 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id e9sm6224304wro.16.2018.11.15.23.48.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 23:48:09 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<765fe28a07d96b0fbd642e5d5f01c123118db4f4.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d5102fba-f56d-f541-b408-834317d7641d@linaro.org>
Date: Fri, 16 Nov 2018 08:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <765fe28a07d96b0fbd642e5d5f01c123118db4f4.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 02/23] linux-user: Add host
 dependency for RISC-V 32-bit
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
X-List-Received-Date: Fri, 16 Nov 2018 07:48:30 -0000

On 11/15/18 11:34 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  linux-user/host/riscv32/hostdep.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 linux-user/host/riscv32/hostdep.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


