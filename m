Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPeG2-0001OU-AY
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 20:58:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPeFz-0001Nt-LT
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 20:58:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPeFr-0004eP-NH
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 20:58:13 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39817)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPeFp-0004Tj-Lj
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 20:58:07 -0500
Received: by mail-pl1-x641.google.com with SMTP id 101so1756736pld.6
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 17:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id;
	bh=lPo1ouk5qStDjBOGV/9Uvw+DCyjyhJkHTs8ZXA1HHQM=;
	b=jhF9bdSluLftUeMTmyr9hb0NSQgPPUUEcm/BYsYUW2kZgx+vdnj7vOIjZDeVl4I3I8
	r9ABo6oESIs1CWAezepu43XZBzfxCiPKMbXpdO2WNcgpm6TivMiX3lH2O/GChuWMzMjn
	dFbf7oLLx/5c52MnV2wrjf5CCOVv/7sIDh4FCDuznkUddKzvcS3mZzMtaPTkWzIZ5Wpi
	cHbYA0mQOqfg+vz4Ns+ON6yK0hKkQCSIp9N04R3CEFr8FnWEF5/vCLGbQ/3KTVtStYIs
	LZAFcnTIjzB7OwA4BI18DEdStKgFSgx3PWvYsrtVGAiiWTEJg4S3dEstdauon2tL5ueW
	RO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
	bh=lPo1ouk5qStDjBOGV/9Uvw+DCyjyhJkHTs8ZXA1HHQM=;
	b=VEj0d39Vss8VaWMzuv2rFVU5O4Qv7dWlJHEfuV48FrA71uGdzcSquTkSC7FVTG87lL
	v6KssjCqUdKZLMRvTE0kQ3OYYYN2xI9HuEjDb//TN8RPnxe1gp5AxxZZO2lRJp+lHnZn
	sAh3Onne86j59qxoab43IxIew1P/AICL7tRXrjPEeq55TGDneFt8Zjke3wrUEXTgSQxd
	dL5l5AoRTbHqlEHrqAS4rf0/EvvDymu/t62xpamD9VM0cBjBLZ8gdD8RZk1POnuaN8Hx
	KT9ytMV0XpnGKQKfaWXLgZOQvml50X3j/fcCIgvqpE+dNIPdHziiYi09ryrETx3RrtCx
	Xhyw==
X-Gm-Message-State: AA+aEWbS8tsztYLezrlHGDqE6/z9zrQqo5/RyAuXYzz+321VflnSudAh
	VGdIa8Thf/OgCZW5OCIJgD7ZaA==
X-Google-Smtp-Source: AFSGD/X/wWuUrgwS7W8j4JdJVL+DcjTHv+H9xMfKDk9u7nijnEm2n9pZQrEblr8eSomn91SkH094rQ==
X-Received: by 2002:a17:902:f44:: with SMTP id 62mr6997987ply.38.1542851884254;
	Wed, 21 Nov 2018 17:58:04 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	i123sm29198638pfg.164.2018.11.21.17.58.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 17:58:03 -0800 (PST)
Date: Wed, 21 Nov 2018 17:58:03 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 17:57:48 PST (-0800)
In-Reply-To: <6559716eae4b53d2cad39ec6011cdd7b1b32138a.1542839652.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
	Alistair Francis <Alistair.Francis@wdc.com>, agraf@suse.de
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-3aa4aa94-927c-4ff8-867b-10d341c90d52@palmer-si-x1c4>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 1/1] riscv: virt: Cast the
 initrd start address to target bit length
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
X-List-Received-Date: Thu, 22 Nov 2018 01:58:16 -0000

On Wed, 21 Nov 2018 14:34:44 PST (-0800), Alistair Francis wrote:
> Ensure that the calculate initrd offset points to a valid address for
> the architecture.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Alexander Graf <agraf@suse.de>
> Reported-by: Alexander Graf <agraf@suse.de>
> ---
>  hw/riscv/virt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 2b38f89070..4467195fac 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -85,7 +85,12 @@ static hwaddr load_initrd(const char *filename, uint64_t mem_size,
>       * halfway into RAM, and for boards with 256MB of RAM or more we put
>       * the initrd at 128MB.
>       */
> -    *start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +    /* As hwaddr is a 64-bit number we need to cast it for 32-bit */
> +#if defined(TARGET_RISCV32)
> +    *start = (uint32_t) (kernel_entry + MIN(mem_size / 2, 128ULL * MiB));
> +#elif defined(TARGET_RISCV64)
> +    *start = (uint64_t) (kernel_entry + MIN(mem_size / 2, 128 * MiB));
> +#endif
>  
>      size = load_ramdisk(filename, *start, mem_size - *start);
>      if (size == -1) {
> -- 
> 2.19.1

Maybe I'm missing something, but wouldn't something like

    uint64_t start_unclobbered = kernel_entry + MIN(mem_size / 2, 128ULL * MiB);
    assert(start_unclobbered == (hwaddr)start_unclobbered);
    *start = (hwaddr)start_unclobbered;

work better?  That should actually check this all lines up, as opposed to just 
silently truncating a bad address.

