Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jY58u-000249-Mw
	for mharc-qemu-riscv@gnu.org; Mon, 11 May 2020 05:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jY58t-00022q-Jr; Mon, 11 May 2020 05:54:35 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jY58s-00057Q-Aw; Mon, 11 May 2020 05:54:35 -0400
Received: by mail-lj1-x243.google.com with SMTP id e25so8757572ljg.5;
 Mon, 11 May 2020 02:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tiyyfkVX+Vv+hcjnSdTeDu1LOtGQ32sOhl+9tc0AzN0=;
 b=fMKMwzHKAL+cC6GYL7w6Jo1hhb5zYEWOu+Hm1gsRT7aE0QuTlXpXlcee6I1vIfHTZC
 Vo9VeSvSNJboZSAY84hXz1eBveXwKvejjHIovRw4E9UfTyYUg71VuDjwlGLgEGTSpzey
 gcCq7dQYd/ajywcWswVmaM5wJQSPlaC4vZTjAmuEVpU5L83wA3QvdbZMz8izaqS5NSTm
 oofor2fr+mK8xGjfS7pD7W4SNCyqQdNEB4eWGL+hLA7IQg4UbP2qqb7gMdvDlICBAqFs
 zW7MSa0A1LOrKMzwxLhYfNPT4H0V3Gf4h4sUii3tJFgofR40LLf6Q3o+UA9GeDOw8op9
 sqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tiyyfkVX+Vv+hcjnSdTeDu1LOtGQ32sOhl+9tc0AzN0=;
 b=WEPW0aSCwLU83LGS3fa2z9m74sg/lmQSoYb/v6UHHZwODAW59gGPDM0phRW4tikb8e
 yxN65x9cMhIXE+vsZvA7ovCupP6pdLYmbxeKlO0/CoUqhASEYqtB385GckZbp/TJFLrK
 FZ7uyhhVhQiqMwGXDF9V/5lHaCH8fUdAnRo6Z1sPOrzPZigh/ksVRnTnKmCKGHtmNm2J
 T2O2a+ZhaEtyRk2LgnYaQQM+o4ZYCKLrNLh5SwTuVcmtXASd4tDA0MqUyveY49c5WRXC
 MiP+jvqOy1+jCfc/vIfin9DMxm0rXu82K+DDv7LRmXfJcYdf7oP9pNeQNlKSyIR5rCk8
 9PJw==
X-Gm-Message-State: AOAM532o4zcFMw/qreivL4hVqtq8c1i0Moq3VmnhebzE5nargEAuVRqt
 9k2T008lN7OogSe14m0Lahg=
X-Google-Smtp-Source: ABdhPJz+MtRuntfrRkEMQVanEs2Ehicxuu4xy5lCw5aWu+zWimC9nOZPengQVdTQtuxI9wjfgHFNyQ==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr9855811ljc.292.1589190871093; 
 Mon, 11 May 2020 02:54:31 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id s7sm10412923lfb.40.2020.05.11.02.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:54:29 -0700 (PDT)
Date: Mon, 11 May 2020 11:54:13 +0200
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
Subject: Re: [PATCH 02/11] sysemu/accel: Restrict machine methods to
 system-mode
Message-ID: <20200511095413.GS5519@toto>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200509130910.26335-3-f4bug@amsat.org>
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
X-List-Received-Date: Mon, 11 May 2020 09:54:36 -0000

On Sat, May 09, 2020 at 03:09:01PM +0200, Philippe Mathieu-Daudé wrote:
> Restrict init_machine(), setup_post() and has_memory()
> to system-mode.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/sysemu/accel.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> index 47e5788530..e08b8ab8fa 100644
> --- a/include/sysemu/accel.h
> +++ b/include/sysemu/accel.h
> @@ -37,10 +37,12 @@ typedef struct AccelClass {
>      /*< public >*/
>  
>      const char *name;
> +#ifndef CONFIG_USER_ONLY
>      int (*init_machine)(MachineState *ms);
>      void (*setup_post)(MachineState *ms, AccelState *accel);
>      bool (*has_memory)(MachineState *ms, AddressSpace *as,
>                         hwaddr start_addr, hwaddr size);
> +#endif
>      bool *allowed;
>      /*
>       * Array of global properties that would be applied when specific
> -- 
> 2.21.3
> 

