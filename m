Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hs6e0-00035a-Nl
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jul 2019 10:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hs6dy-00032r-DT
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 10:28:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hs6dx-0000CC-Cl
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 10:28:54 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54017)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hs6dx-0000Bl-6e
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 10:28:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so54067293wmj.3
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2019 07:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JCeT5mas/pn+qBD9p6HWZmZbl0APWuylrfio7g+sDlg=;
 b=pYgFXH7NFD5yXyNNvC9nJpBFw56MkioyTMMBoJqyPY+q5ewKyiPhEPpSxIdHqTX9ft
 t/wknT/3YxNe5LA6FFYsgp3ueplMiLUH9POH+9vJiu2ZjP8x3DiHtYFlN4rjbWAHb88x
 JjVFUJfRzGJR0IBQSs7N4tO234CthBku+HYxQEKXo4qN0iPZTOlBsj/u2PCL0TPcQBO9
 wyIWI0uXwzjXE/A1VTlkgBipmp70T8+3vCUCXNYCdlQHI5aFT6I0nDGrjH/zXXw634oz
 FhaenOx/377dhz6ZE2yTqjQ1TslYK6VcETCfWKqZWKA3MzKwIpyi2l6p+1wWMH6TTkRA
 vXlA==
X-Gm-Message-State: APjAAAX9Gmth4g1QsmFneLICv6M+Jj2k4w9KKHn7S+tKlOyxwD3dw0ee
 jhKEj6ZydbqMhkqB1AChmCQwzQ==
X-Google-Smtp-Source: APXvYqzy2Cx+dZxrRLl/A5XSNfnBbMePNYcIH2OH6gcxH58zTBR9iXIduTITDLoR543nvyeJSR1y0A==
X-Received: by 2002:a1c:3:: with SMTP id 3mr101046321wma.6.1564410531916;
 Mon, 29 Jul 2019 07:28:51 -0700 (PDT)
Received: from [192.168.1.38] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id d10sm73102016wro.18.2019.07.29.07.28.51
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 07:28:51 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@sifive.com
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <50c1c6a3ace8b40f7b9d5395a2c3457cf1852721.1564080680.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6384a0f9-4b24-13b2-bcb7-053fefcaa1a5@redhat.com>
Date: Mon, 29 Jul 2019 16:28:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <50c1c6a3ace8b40f7b9d5395a2c3457cf1852721.1564080680.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 3/6] riscv: plic:
 Remove unused interrupt functions
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
X-List-Received-Date: Mon, 29 Jul 2019 14:28:55 -0000

On 7/25/19 8:52 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_plic.c         | 12 ------------
>  include/hw/riscv/sifive_plic.h |  3 ---
>  2 files changed, 15 deletions(-)
> 
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index 0950e89e15..864a1bed42 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -161,18 +161,6 @@ static void sifive_plic_update(SiFivePLICState *plic)
>      }
>  }
>  
> -void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq)
> -{
> -    sifive_plic_set_pending(plic, irq, true);
> -    sifive_plic_update(plic);
> -}
> -
> -void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq)
> -{
> -    sifive_plic_set_pending(plic, irq, false);
> -    sifive_plic_update(plic);
> -}
> -
>  static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid)
>  {
>      int i, j;
> diff --git a/include/hw/riscv/sifive_plic.h b/include/hw/riscv/sifive_plic.h
> index ce8907f6aa..3b8a623919 100644
> --- a/include/hw/riscv/sifive_plic.h
> +++ b/include/hw/riscv/sifive_plic.h
> @@ -69,9 +69,6 @@ typedef struct SiFivePLICState {
>      uint32_t aperture_size;
>  } SiFivePLICState;
>  
> -void sifive_plic_raise_irq(SiFivePLICState *plic, uint32_t irq);
> -void sifive_plic_lower_irq(SiFivePLICState *plic, uint32_t irq);
> -
>  DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>      uint32_t num_sources, uint32_t num_priorities,
>      uint32_t priority_base, uint32_t pending_base,
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

