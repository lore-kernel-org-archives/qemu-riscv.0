Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jY52V-0001Ax-9k
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 05:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jY52T-00016F-1E; Mon, 11 May 2020 05:47:57 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jY52S-0003Oz-4M; Mon, 11 May 2020 05:47:56 -0400
Received: by mail-lj1-x243.google.com with SMTP id f11so8751386ljp.1;
 Mon, 11 May 2020 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=LLpJhfY06EKF+oBDQZd0EOAQxJmdqFBtBjBb9Q83wyQ=;
 b=dUMWPGtFKW6rfx1FUyj6/UlWhOOJJ8G4+tG7JANPNzAaQhFgWx/rOvTZeiNafCTOcN
 Iazj2I9S83+BU11LF6gkqmvKmlCZeX9TcXBymElrfGdsW/px7YFloQ0scppSTRkCR2Lr
 TFZT8jq/Gi1hiNimejQ7nJ5qG277mVE0w5p+WfAxuD2KetciOvfNwZMau3pqU7FvqoSG
 9m7NKy4gJbZWd6r9mAmdjByfP/hjL0NvXiZnkEQqxcrWzZQb7k3N4CdoYLg2GlP9lVR5
 OKVfA+kgyIpiubCPlqTP183NUYpU4btkqwNnJ3pwTJ+NcX2LorVy4tHvlr2tzmM4wwJw
 +ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LLpJhfY06EKF+oBDQZd0EOAQxJmdqFBtBjBb9Q83wyQ=;
 b=XMedJKmryukFFEMfQ4v8YCS+EpmOBOYTCQd+GHdmB9qkZ+iWqtmEE/ilGMDPnJl1dP
 tORTXl1RgqS1lSkWUmWJ+Xg4rvhGJjiK4W7VLZNF7rctbtxnSrrvk7NEJtIqLncHWm/C
 JC7O8MY8BfIJoa17B5sLoiO2hJpJdG/CPu3nC0XhltcCduyugfD30JKZ5PqbEX9WCC0t
 kNUhp2YbukUFJJUKwabgw1qN3wdCqOOxBesGnhiEbTMKt685O1RrNNFpY3sQMN5e5YRT
 EnUd816PWoYjS9pK76/LMflGMV2ERLmLK/yHMy5UUciizUD/c2Ecudc5qmRLQDSCp/8+
 Pp5A==
X-Gm-Message-State: AOAM531olB1WClbNEN6/a8w8FguiD4KAl1OWXFSO67mcEtilzzEK99sj
 xgWWItYEUhwaDkFvtc3dm1Y=
X-Google-Smtp-Source: ABdhPJwLcg+uXF0jvSmlx/FD+/OzvbjV1vXuoRWwrq5i5XkGfM+aIGwidcM3ywJk6CJLLncUZJjS3g==
X-Received: by 2002:a2e:a169:: with SMTP id u9mr9793594ljl.144.1589190473033; 
 Mon, 11 May 2020 02:47:53 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w9sm9420258ljj.88.2020.05.11.02.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:47:52 -0700 (PDT)
Date: Mon, 11 May 2020 11:47:36 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marek Vasut <marex@denx.de>, Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 04/11] sysemu/hvf: Only declare hvf_allowed when HVF is
 available
Message-ID: <20200511094736.GR5519@toto>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200509130910.26335-5-f4bug@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 11 May 2020 09:47:57 -0000

On Sat, May 09, 2020 at 03:09:03PM +0200, Philippe Mathieu-Daudé wrote:
> When HVF is not available, the tcg_allowed variable does not exist.

Typo in commit message tcg_allowed -> hvf_allowed.

With that fixed:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/sysemu/hvf.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
> index d211e808e9..fe95743124 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -18,7 +18,6 @@
>  #include "exec/memory.h"
>  #include "sysemu/accel.h"
>  
> -extern bool hvf_allowed;
>  #ifdef CONFIG_HVF
>  #include <Hypervisor/hv.h>
>  #include <Hypervisor/hv_vmx.h>
> @@ -26,11 +25,12 @@ extern bool hvf_allowed;
>  #include "target/i386/cpu.h"
>  uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
>                                   int reg);
> +extern bool hvf_allowed;
>  #define hvf_enabled() (hvf_allowed)
> -#else
> +#else /* !CONFIG_HVF */
>  #define hvf_enabled() 0
>  #define hvf_get_supported_cpuid(func, idx, reg) 0
> -#endif
> +#endif /* !CONFIG_HVF */
>  
>  /* hvf_slot flags */
>  #define HVF_SLOT_LOG (1 << 0)
> -- 
> 2.21.3
> 

