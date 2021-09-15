Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQP9L-0000Q7-5C
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP9B-0000IR-HQ; Wed, 15 Sep 2021 03:15:57 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP99-0005Ai-VK; Wed, 15 Sep 2021 03:15:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id i3so1320911wmq.3;
 Wed, 15 Sep 2021 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CD+GtFG/D8FkUi0His+Dv+ElEr7hO3Pmw4LHgWK0Zk8=;
 b=V+Mz41aSf8SY9q6ShyXcQre1TnM+torVR6c4IUL44YbbkiI9F7BFrRRgmyfh+kTBU4
 nPWNLMGwPJRMCH7/te7534gxrSAIEFSfQgU+0VXYhfyh2QLoR30qGvG+lDYfu/AunmKb
 1nHPsod5OV1gifflKZfHlM+9gdrngBQ/aCfb6nfUPJH2BLq23pZveHEF/L02v2XUklat
 7PXc5F0UKAnnrehI5hPVvEaMIDkly1AmD9ncWvsCr96/FIjHBVLYOK9jztIxc86NOjfu
 lCDXuL2PkkXMlmEX6lU4MS/FJlCZdSGLnq3RSVI13v14r9omgfYgPf0dNIALcOYc+Eie
 G4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CD+GtFG/D8FkUi0His+Dv+ElEr7hO3Pmw4LHgWK0Zk8=;
 b=LYWp3MsLP2CkiSgBmUKYJLOzK1KBxYnwG8fj5M/YUp5umC2tx7XY/JRTz3HrqISm3r
 Gw5aE32ltamo+tmQ1vwNBqwW2k/UGqWuUCx0SN38OC6q0swivuohaH6PKGFP9q0N++O3
 jLWTor/CO1Xg3RKGGFE6E8hkWji6lSLiwIB3+gBgYoEsA8KAPVAUq4E/hdoh4RkltCyO
 y3/OwFQiDRl8qBmjI4jR1lpu6T1MmaG0UqaRqZTLhaULxEFcfxPWAbyWH03mAunKJNph
 DIYiJ1Y7qbQZs3m4FNmHVrVOz1ijNZcuVtvkDwGyEtiSkOn07zt7PT9B8ByEGsnawzJv
 BwMw==
X-Gm-Message-State: AOAM53179lZWBZitXExY3DbFHTA3f95KKfv3UEYoMQZKJC1SofOhJebH
 y8hIjeMNGxoJHNYeOLHnTso=
X-Google-Smtp-Source: ABdhPJzS+2sYDHqsi5hgBfTJ4CigGLYxHviUcpqrbAChB5tp9F0+QHZIjfgNAj0tHjIzlFvtpdlc+g==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr2817530wmi.192.1631690151592; 
 Wed, 15 Sep 2021 00:15:51 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id s14sm3122087wmc.25.2021.09.15.00.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:15:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 13/53] target/hppa: convert to use format_state instead
 of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-14-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <82e8f264-71a6-a283-0412-e442aba99e18@amsat.org>
Date: Wed, 15 Sep 2021 09:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-14-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Sep 2021 07:16:00 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/hppa/cpu.c    |  2 +-
>  target/hppa/cpu.h    |  2 +-
>  target/hppa/helper.c | 25 ++++++++++++++-----------
>  3 files changed, 16 insertions(+), 13 deletions(-)

> @@ -110,20 +111,22 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      psw_c[18] = '\0';
>      psw_cb = ((env->psw_cb >> 4) & 0x01111111) | (env->psw_cb_msb << 28);
>  
> -    qemu_fprintf(f, "PSW  " TREG_FMT_lx " CB   " TREG_FMT_lx " %s\n",
> -                 psw, psw_cb, psw_c);
> +    g_string_append_printf(buf,
> +                           "PSW  " TREG_FMT_lx " CB   " TREG_FMT_lx " %s\n",
> +                           psw, psw_cb, psw_c);
>  
>      for (i = 0; i < 32; i++) {
> -        qemu_fprintf(f, "GR%02d " TREG_FMT_lx "%c", i, env->gr[i],
> -                     (i & 3) == 3 ? '\n' : ' ');
> +        g_string_append_printf(buf, "GR%02d " TREG_FMT_lx "%c", i, env->gr[i],
> +                               (i & 3) == 3 ? '\n' : ' ');
>      }
>  #ifndef CONFIG_USER_ONLY
>      for (i = 0; i < 8; i++) {
> -        qemu_fprintf(f, "SR%02d %08x%c", i, (uint32_t)(env->sr[i] >> 32),
> -                     (i & 3) == 3 ? '\n' : ' ');
> +        g_string_append_printf(buf,
> +                               "SR%02d %08x%c", i, (uint32_t)(env->sr[i] >> 32),
> +                               (i & 3) == 3 ? '\n' : ' ');
>      }
>  #endif
> -     qemu_fprintf(f, "\n");
> +     g_string_append_printf(buf, "\n");

        g_string_append_c(buf, '\n');

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  
>      /* ??? FR */
>  }
> 

