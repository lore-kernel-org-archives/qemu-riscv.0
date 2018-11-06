Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKBFN-0005SU-ID
	for mharc-qemu-riscv@gnu.org; Tue, 06 Nov 2018 18:59:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKBFI-0005GH-Iy
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 18:58:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKBF7-0000hP-Tl
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 18:58:51 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKBF6-0007Wz-Qy
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 18:58:45 -0500
Received: by mail-pl1-x643.google.com with SMTP id g59-v6so6972569plb.10
	for <qemu-riscv@nongnu.org>; Tue, 06 Nov 2018 15:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=f9wvMtN3eMmnij2ZHeCcGO+7xYdDoQ3avyR9lHgAR0A=;
	b=bzttC0ED27A3KAaTXH5tfmB44iciXT3gYfcI4akapIU5R0F0c95zBoKMChJtKt7enS
	/0iM3O6KyZKnZLGsK5bMoHUa/cpxN60NUFHse9GSW8wSNWjYQOm5OwgPCFy51rUQQV7S
	h1WH3o2CxB3G7krHSP5ffYxgxBiJEgeVIismhKr4DC/YLyPNcdowD/hIjIF1SMQOMpee
	ZNgxtswVWY4hwMNikFqGgYyXz1+vewVtW4aiRSb2sNOs0YNm17WauR2kBwpjSf4K+oT2
	/+Uv7/eUeSlLVxzvQFBX29tYkE6LusKxtnWeq112RBVvLLvIHWKks7pmr0js0pLlMOY+
	eU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=f9wvMtN3eMmnij2ZHeCcGO+7xYdDoQ3avyR9lHgAR0A=;
	b=LQpUli2Q4fRnHsk1wRI+oaob47aKSE3qYz0CcUr5cKTNmPXKA40ki1hu0jio967gk6
	tN6ivyBK/6HyDEoUnOaAx8cloMOVh/S+VKPhxrrr6Yzd2apIfTTqh1lrwrUfoIgxuGJ5
	Kcd2WXdnuMAkIQ1djZkUEmZrGl/rmnssrTeZ0T1Id2MngBFzO8fGAA5qle2CDCzmZPLR
	FRBwWwenb1S9zMvk+k76hwv4FJW6bSAIs2auJHZlwvvCQKuXeV6ibVx2D/un+IrF4gxU
	4bK8R68WLHJwZmUcvu8h3pGfKima5J2gNQCfzXzzumUzAUuGi6uIXCcYpT6k8Rrg7Hgg
	SQGg==
X-Gm-Message-State: AGRZ1gLq0a6KhxJVuScbqSCJn0YtLntZ+Llt7lMdEviwf2fIQD73oWtN
	XLys8xArNJkWDy1fNka/ONSxSg==
X-Google-Smtp-Source: AJdET5dOT/7TUQIlO97nqsEj7Y24gZ4ZnvaisEc1GWT0zL+ke/uukxAaRfIUqdFPFbon8Szes8DuBA==
X-Received: by 2002:a17:902:9a04:: with SMTP id
	v4-v6mr27914912plp.247.1541548708173; 
	Tue, 06 Nov 2018 15:58:28 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	s184sm24226462pgc.38.2018.11.06.15.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Nov 2018 15:58:27 -0800 (PST)
Date: Tue, 06 Nov 2018 15:58:27 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 15:54:27 PST (-0800)
In-Reply-To: <3988cd7b9d292017537f75c2eed70295a3a84718.1541447021.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Peter Maydell <peter.maydell@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-88725c82-3433-4a1b-afdf-7baa657a6be0@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv: spike: Fix
 memory leak in the board init
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
X-List-Received-Date: Tue, 06 Nov 2018 23:59:00 -0000

On Mon, 05 Nov 2018 11:44:41 PST (-0800), Alistair Francis wrote:
> Coverity caught a malloc() call that was never freed. This patch ensures
> that we free the memory but also updates the allocation to use
> g_strdup_printf() instead of malloc().
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/riscv/spike.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 8a712ed490..268df04c3c 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -316,9 +316,7 @@ static void spike_v1_09_1_board_init(MachineState *machine)
>  
>      /* build config string with supplied memory size */
>      char *isa = riscv_isa_string(&s->soc.harts[0]);
> -    size_t config_string_size = strlen(config_string_tmpl) + 48;
> -    char *config_string = malloc(config_string_size);
> -    snprintf(config_string, config_string_size, config_string_tmpl,
> +    char *config_string = g_strdup_printf(config_string_tmpl,
>          (uint64_t)memmap[SPIKE_CLINT].base + SIFIVE_TIME_BASE,
>          (uint64_t)memmap[SPIKE_DRAM].base,
>          (uint64_t)ram_size, isa,
> @@ -345,6 +343,8 @@ static void spike_v1_09_1_board_init(MachineState *machine)
>      /* Core Local Interruptor (timer and IPI) */
>      sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
>          smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
> +
> +    g_free(config_string);
>  }
>  
>  static void spike_v1_09_1_machine_init(MachineClass *mc)

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

