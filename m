Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKaD0-0003Pp-Qn
	for mharc-qemu-riscv@gnu.org; Wed, 07 Nov 2018 21:38:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKaCw-00038U-G2
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 21:38:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKaCs-0007wJ-Ep
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 21:38:10 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKaCr-0007un-IS
	for qemu-riscv@nongnu.org; Wed, 07 Nov 2018 21:38:06 -0500
Received: by mail-pl1-x641.google.com with SMTP id w24-v6so8798431plq.3
	for <qemu-riscv@nongnu.org>; Wed, 07 Nov 2018 18:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=tx0yhX/Axlh3bdR4BbD+Bhd3QJPCWUBPVkJtOdGYYp4=;
	b=Jtx563ApBZfE4ZW7y6ma3an6PBu1TgXRTUEMGII3BRZpes3ecj3rhLVVWpeKgKb33T
	wGQE+fl4XXJ2ZzhuyQECH1CK4vRXq+e91NpW8BCTby+lmawyUdRZh6Dtk3qXXzhFP7+Q
	TRRdEDlrQcQZ/IPP6K5GTiHnYHKXKngiOqVrv0qD9wCm2FzOTiJx63VXC1+ELC9BakxW
	b4lgkWho4VlQMDLkO0lNch0olhRbzbSwOw7VXn14vUMZUIGUopIqA9vjN28ERfE+Dw77
	pgAyWZulcBWaPDzoDoGw7qvIsM81KgpF90Y/+uS8MmxRogRm3O43b6TKSwJzRUoofnG6
	BC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=tx0yhX/Axlh3bdR4BbD+Bhd3QJPCWUBPVkJtOdGYYp4=;
	b=YDLWXqJZFcE+hRJat5Dw79FlWnvNdZDXOrFMQDxOHpY+KnvSYeeWnLSoSqZhgHa8wP
	fECA/s8GIUo/rz5h3xf4p/7ku+qFF4sz0f9C0Du2jjyvHl9lx5/Atkf/gbY29D1qmkJD
	eh7HyU2Z/MNWKw79UNYphduGSV9NPnBhgnF7Ud/3N+va0Dhy5W+jqfyCjfSm/9e/pTLA
	87fHL1wZP6urcJnAki148bY7GLALPXQ9Ry9r9AB4C7eJy3LXf5E0M5UPlWJnR09X1mwR
	nXCUevsvYH3Eu/VOw3CiX/WsgGb6liE7dwbFti6yPJR/2IAD1VgdXnk2iFYIOFbOxb1w
	PWIA==
X-Gm-Message-State: AGRZ1gIVhHoGCRgTFVMktyvXbLWPOyxCkYImK2eYc0WvPQuqZ/i4uj50
	xWI1NadFCJ7biVWVF2tuwE4VQA==
X-Google-Smtp-Source: AJdET5eUrisRzRmMRLSMzpqTRNWgcsD7l6i+6UT/PF1suL+n3+l4IJ9qaUmyBIKwnoSIQizga3Tngw==
X-Received: by 2002:a17:902:c01:: with SMTP id
	1-v6mr2805992pls.15.1541644682079; 
	Wed, 07 Nov 2018 18:38:02 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	a17sm1709464pgm.26.2018.11.07.18.38.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 18:38:01 -0800 (PST)
Date: Wed, 07 Nov 2018 18:38:01 -0800 (PST)
X-Google-Original-Date: Wed, 07 Nov 2018 18:37:52 PST (-0800)
In-Reply-To: <1793576616012e06e68cd9e0215eb907ff2ef12b.1541627403.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-2f508723-0da1-4d97-9e9e-cbc12898023f@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [PATCH for 3.1 v1 1/1] hw/riscv/virt: Free the
 test device tree node name
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
X-List-Received-Date: Thu, 08 Nov 2018 02:38:13 -0000

On Wed, 07 Nov 2018 13:51:45 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a137a503c..2b38f89070 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -240,6 +240,7 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
>      qemu_fdt_setprop_cells(fdt, nodename, "reg",
>          0x0, memmap[VIRT_TEST].base,
>          0x0, memmap[VIRT_TEST].size);
> +    g_free(nodename);
>  
>      nodename = g_strdup_printf("/uart@%lx",
>          (long)memmap[VIRT_UART0].base);
> -- 
> 2.19.1

Thanks.  I got a bit behind this week so I didn't send the pre-PR, but I indent 
to send a PR tomorrow.  That PR currently only contains this patch.

