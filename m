Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hguWS-0004ZI-0L
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hguWO-0004WM-QF
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hguWM-0005hu-Ln
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:18:48 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hguWM-0005gz-EK
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:18:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so3298148pfe.11
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cdnW3vBpIbBthg3lp9UrlXXEDiqP6W4bvRzXc/KCoAQ=;
 b=fjE3+KBlQmqVaCFgW5K+W01MYn3Gn2W5WJL63uJaxsC+z0STxb72s8febGLuA9WpTS
 VTPLFBGmmOd/Fjo+s2DdgfZpLP8MlsesKKEWs2GHoSbAY+r74Xy7cuTxWGydvqTOIb/D
 F8sQiK745EnhS/6xpEzchLJhBasa471qKti36+vh85GG84F1fukATOXpBWZqksBpU2qR
 UKVTIjtGfflsiN5FH5hiti0YNIfIk9n6LJdl3f7cyLr1gmGkLCOhNWjlbydq4D7p62zr
 I9DRDe2/GmuFixCemmq83GvPKWM8OzyvhK1oLI1Ms2l2YZpKSpD74Cdg8KrerFNXkrEu
 3xQA==
X-Gm-Message-State: APjAAAXt3OVNmDftStvdpY/20uqtkZxqROUIVlhPVb21mycc1VYPAxC+
 R+oEXR6v7TvjRep87E/9Ev5bnQ==
X-Google-Smtp-Source: APXvYqz/y1f7RaRvvCeV4tC302CsTfhW8sWmJjS4C3G0peTDovfDfADSN4H81JhirFllqg8f2lWB1g==
X-Received: by 2002:a63:b243:: with SMTP id t3mr10321160pgo.223.1561742324220; 
 Fri, 28 Jun 2019 10:18:44 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id d26sm3485485pfn.29.2019.06.28.10.18.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:18:43 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:18:43 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Jun 2019 10:13:14 PDT (-0700)
In-Reply-To: <20190628161503.16760-1-alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-c58538a5-2727-4a7a-bae0-3e1ec2d34706@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: Re: [Qemu-riscv] [PATCH] fixup! roms: Add OpenSBI version 0.3
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
X-List-Received-Date: Fri, 28 Jun 2019 17:18:51 -0000

On Fri, 28 Jun 2019 09:15:03 PDT (-0700), Alistair Francis wrote:
> ---
>  roms/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/roms/Makefile b/roms/Makefile
> index 562ed726fd..dc70fb5aea 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -179,7 +179,7 @@ opensbi64-virt:
>  		PLATFORM="qemu/virt"
>  	cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-virt-fw_jump.bin
>
> -opensbi64-virt:
> +opensbi64-sifive_u:
>  	$(MAKE) -C opensbi \
>  		CROSS_COMPILE=$(riscv64_cross_prefix) \
>  		PLATFORM="qemu/sifive_u"

Thanks!

