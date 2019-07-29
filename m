Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hs6ig-0006Tf-1B
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jul 2019 10:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hs6ie-0006TL-6e
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 10:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hs6id-0003XW-61
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 10:33:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34802)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hs6ic-0003XC-W8
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 10:33:43 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so62156870wrm.1
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2019 07:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lGRv+t0quDP+Ze/c8kxZ+GqzrVcwVVvrd4yX5h+DcfQ=;
 b=c81GdvMP920SGICQcII41biF4WH3i7eBxcKLs7cEFlIdnG6hnDw0XZl6gNz+jjpfxV
 CNsQkrwtiJSz7T2rbFywajLLI03rTAd1LvaOKRTL/eTjkn8LYhEpZK3Un4U1un4FxcMj
 /g7NKys9JUFrgARVvEnuxTPlDip8tVB06QbvUkmtqF2NxCbvflnt7BUwQiyGOdtGxoou
 I+7mNwrf0d0ptHB5wUkH/6jwX/F8vERSIpSBxdXG5wCs6cvc0fliIR+oP9YvsBg74gYP
 9YwBY60DgdCS2z/Me39u1zWLTzUIB8Euk3G0x/P6mmKgO193JIU1p6jvVT+d7SXN6Mkc
 jTOg==
X-Gm-Message-State: APjAAAWfg1lDrokN00flt4ilFkm+HNk4Kw38O65Afh/InO4sz0/kJtv2
 KpQqn71dVStmqF1nEMU87LAIRA==
X-Google-Smtp-Source: APXvYqxNT2pvoSS/8bSOmvUpkXE5nY8VsCI1CH0O7fNPgGMqBXtzegOU5pezqyLNlPtYNzCPXfgqXA==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr41937968wrs.88.1564410822102; 
 Mon, 29 Jul 2019 07:33:42 -0700 (PDT)
Received: from [192.168.1.38] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id z6sm55428718wrw.2.2019.07.29.07.33.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 07:33:41 -0700 (PDT)
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@sifive.com
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <6a7d3b524e7c0a41ef232d9dc21d7c337b05b97d.1564080680.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3d45d806-3cc2-a13f-a431-c5a4d6fe42b8@redhat.com>
Date: Mon, 29 Jul 2019 16:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6a7d3b524e7c0a41ef232d9dc21d7c337b05b97d.1564080680.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v1 1/6] target/riscv:
 Don't set write permissions on dirty PTEs
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
X-List-Received-Date: Mon, 29 Jul 2019 14:33:45 -0000

On 7/25/19 8:52 PM, Alistair Francis wrote:
> Setting write permission on dirty PTEs results in userspace inside a
> Hypervisor guest (VU) becoming corrupted. This appears to be becuase it

"because"

> ends up with write permission in the second stage translation in cases
> where we aren't doing a store.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e32b6126af..f027be7f16 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -340,10 +340,8 @@ restart:
>              if ((pte & PTE_X)) {
>                  *prot |= PAGE_EXEC;
>              }
> -            /* add write permission on stores or if the page is already dirty,
> -               so that we TLB miss on later writes to update the dirty bit */
> -            if ((pte & PTE_W) &&
> -                    (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
> +            /* add write permission on stores */
> +            if ((pte & PTE_W) && (access_type == MMU_DATA_STORE)) {
>                  *prot |= PAGE_WRITE;
>              }
>              return TRANSLATE_SUCCESS;
> 

