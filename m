Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9CUY-0004BL-HH
	for mharc-qemu-riscv@gnu.org; Tue, 03 Mar 2020 13:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CUV-0004B3-Ve
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 13:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CUU-0004kM-2V
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 13:42:03 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39263)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9CUS-0004iM-I4
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 13:42:01 -0500
Received: by mail-pg1-x544.google.com with SMTP id s2so1939605pgv.6
 for <qemu-riscv@nongnu.org>; Tue, 03 Mar 2020 10:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ihGb95fli6TTZlBLRskT6NVEplBL96MsAsHOeKH3oNU=;
 b=GPJF7rqS2uXhp9Zp1ihYIyooWwy1HXu/JLDUTZpeWFLj3YNWB2e2EWaMEuSS17xJFm
 t5VqQBqmXIYk9b4TFHlSrUren4v+3AFTNL7BiYSWfHd1Nv2278FyzTNFVimv/FTmvxb0
 4ggvamMihoI3xvlaFitqGWjo5FnCu+Rsn91g7ZmpwRlGefJPr+kxIf4CFigEMMll+K6U
 XuEdpVi7mAezg5iR/6+Yh6fYu1m3JIo4ou6NhPQd2wAh88VS/iBw5q7Udfle7bRwLuRG
 Cvw89cEYepV/S9YYlrOvNpdGE+9vkxz+D/zrRpf4N+pcHKfGC8sZeaiUSeV6u5WXpCrW
 z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ihGb95fli6TTZlBLRskT6NVEplBL96MsAsHOeKH3oNU=;
 b=VCOk8fTtZmJ/3KVsnmXd1r8dSm1XMEXXfnbUWMPavV9uqEYNFQ+QsPf6Sf0seMYo7e
 AMKJqnrUl3KhyzbCt1Fpo/7lREewCqxyTr29ywgIEps8xiSSHQIzA+MI/5KqQqJGWuog
 Rl43VY6rA835xjCeLrzTiMdj9PCE419i8HEQ7SBPD5qkc/lG9Xygf+pcfztcBdG2oe1s
 k1ceRgG2yEBoGgfg9aXz0uQw2tF3tL4pOD/8INO9Od4BI5EdJr8yzSdiM53G6H0hk1FF
 1aVVw7UlTYFrK9mt2Fl8iQ3beeb3t19amPqWP8TCbpYmHcg5HCdjZInjDgGx/9g1qFEr
 iUsA==
X-Gm-Message-State: ANhLgQ2PG7jyAKp4oViTdRX8JP+pUanFwT4p/nVqDnVr1zyXnmtctBek
 m5/YZ28P+XkUVtTGj1riCDG6/A==
X-Google-Smtp-Source: ADFU+vsfEilGsCcupC5aebBrXellXDMXG5hC9z98bYmUDK/YGBIfkgYiy1VMzfe7nagCQN4XTyqwEg==
X-Received: by 2002:a63:f752:: with SMTP id f18mr5306129pgk.196.1583260919257; 
 Tue, 03 Mar 2020 10:41:59 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d5sm19768937pga.36.2020.03.03.10.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:41:58 -0800 (PST)
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200303100511.5498-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bea66f5-c9d6-c605-22dc-8700f022729a@linaro.org>
Date: Tue, 3 Mar 2020 10:41:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303100511.5498-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Tue, 03 Mar 2020 18:42:05 -0000

On 3/3/20 2:05 AM, Peter Maydell wrote:
> The CPUClass has a 'reset' method.  This is a legacy from when
> TYPE_CPU used not to inherit from TYPE_DEVICE.  We don't need it any
> more, as we can simply use the TYPE_DEVICE reset.  The 'cpu_reset()'
> function is kept as the API which most places use to reset a CPU; it
> is now a wrapper which calls device_cold_reset() and then the
> tracepoint function.
> 
> This change should not cause CPU objects to be reset more often
> than they are at the moment, because:
>  * nobody is directly calling device_cold_reset() or
>    qdev_reset_all() on CPU objects
>  * no CPU object is on a qbus, so they will not be reset either
>    by somebody calling qbus_reset_all()/bus_cold_reset(), or
>    by the main "reset sysbus and everything in the qbus tree"
>    reset that most devices are reset by
> 
> Note that this does not change the need for each machine or whatever
> to use qemu_register_reset() to arrange to call cpu_reset() -- that
> is necessary because CPU objects are not on any qbus, so they don't
> get reset when the qbus tree rooted at the sysbus bus is reset, and
> this isn't being changed here.
> 
> All the changes to the files under target/ were made using the
> included Coccinelle script, except:
> 
> (1) the deletion of the now-inaccurate and not terribly useful
> "CPUClass::reset" comments was done with a perl one-liner afterwards:
>   perl -n -i -e '/ CPUClass::reset/ or print' target/*/*.c
> 
> (2) this bit of the s390 change was done by hand, because the
> Coccinelle script is not sophisticated enough to handle the
> parent_reset call being inside another function:
> 
> | @@ -96,8 +96,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
> |     S390CPU *cpu = S390_CPU(s);
> |     S390CPUClass *scc = S390_CPU_GET_CLASS(cpu);
> |     CPUS390XState *env = &cpu->env;
> |+    DeviceState *dev = DEVICE(s);
> |
> |-    scc->parent_reset(s);
> |+    scc->parent_reset(dev);
> |     cpu->env.sigp_order = 0;
> |     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Testing was by 'make check' and 'make check-acceptance'.
> 
> I need this patch as a preliminary to some arm stuff I'm
> doing, but I think it makes sense as a cleanup in its own
> right so I'm sending it out early for review. If it's not
> yet in master before I get round to finishing the stuff
> that depends on it I'll resend it as part of that series.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

