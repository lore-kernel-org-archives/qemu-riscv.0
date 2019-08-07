Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvIWs-0000Ma-Fu
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 05:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60709)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvIWq-0000MC-LJ
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvIWp-00026i-IH
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:46:44 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvIWp-00026A-Cv
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 05:46:43 -0400
Received: by mail-wm1-f66.google.com with SMTP id 10so2021846wmp.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2019 02:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FjEitvLQH4IYhQizIH+kqPj2lpDQjk0LVHd1jpjqFE0=;
 b=qSliP8yv5F1JKsWN7hWw0/vHaiounkYKKL/xG4lApV8OQZ83WC6lDXnnmzX06w2/g0
 a78wokrj1pkjb20y784hG3u+QtSVL2I5udPFXXmAaxVhBYutwmPXa2zihx1GBceNEkNj
 Ssat5NlWi3InUyT0Vcv4+PYof/iyyIhjuGxUTZQcGkKTRqzT/MCmBM8bZna9yWgRmnjP
 /FUZ69GIHf1aljtR7UKykP6THLyD0uFZSCnkMCZyZGud3+TTODdrqYiI03w4uMMkJFm+
 mACvoHECq+PW26BHQAgP3ZBm94OFTbqAV58CbtIpljrgGk5PCFH+5PKvnAiBXVIPgpWW
 UY3A==
X-Gm-Message-State: APjAAAXyQeoePUIPpc1RLLyg4B7sP6i1OX0kdtEHi0f1be4pBGC/ERUd
 kBObSNQc8U7aMWHH77Awd0pat07izWU=
X-Google-Smtp-Source: APXvYqyyFuuMPjycs07mZVi3BSBuwl2NZ+m4bgeUPT80+3QrzYG7R+GobeFmS1JXrY54N2D22jbutQ==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr9608774wmh.100.1565171202027; 
 Wed, 07 Aug 2019 02:46:42 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id i6sm90316882wrv.47.2019.08.07.02.46.40
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 02:46:41 -0700 (PDT)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
 <1565163924-18621-8-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9ed12581-f73e-af09-0a0e-7bce3b69d998@redhat.com>
Date: Wed, 7 Aug 2019 11:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565163924-18621-8-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 07/28] riscv: sifive_u: Set
 the minimum number of cpus to 2
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
X-List-Received-Date: Wed, 07 Aug 2019 09:46:45 -0000

On 8/7/19 9:45 AM, Bin Meng wrote:
> It is not useful if we only have one management CPU.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - update the file header to indicate at least 2 harts are created
> 
>  hw/riscv/sifive_u.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 821f1d5..91f3c76 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -10,8 +10,8 @@
>   * 1) CLINT (Core Level Interruptor)
>   * 2) PLIC (Platform Level Interrupt Controller)
>   *
> - * This board currently generates devicetree dynamically that indicates at most
> - * five harts.
> + * This board currently generates devicetree dynamically that indicates at least
> + * two harts and up to five harts.
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -429,6 +429,8 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
>       * management CPU.
>       */
>      mc->max_cpus = 5;

I'm confuse this patch does not apply on top of v4.1.0-rc4.

Using #define makes these comments redundant, something like:

#define MANAGEMENT_CPU_COUNT 1
#define COMPUTE_CPU_COUNT 4

then you could use

  max_cpus = MANAGEMENT_CPU_COUNT + COMPUTE_CPU_COUNT

and

  min_cpus = MANAGEMENT_CPU_COUNT + 1.

> +    /* It is not useful if we only have one management CPU */
> +    mc->min_cpus = 2;
>  }
>  
>  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
> 

