Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPB5-0002vs-PY
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPAz-0002sw-1H; Wed, 15 Sep 2021 03:17:50 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPAu-0006eR-Cs; Wed, 15 Sep 2021 03:17:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b6so2186206wrh.10;
 Wed, 15 Sep 2021 00:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ixZK3t92hTimbYbnCuhANOq5cLXlW8doOOAwoV7788=;
 b=DUL9myPARGtSK91yr0JFhh8GPTGeqr0nx6qVSpnNbIq6afy1BIQtUOgwKTUso6aVKb
 uoiJvE918UVEtzvAMoCd6A6uEzALBN5DVaagnzjr7rpGJgpFbuhF4AkDWj6JacUlUsVF
 9CPv8p7ScLBb9kwZ0A5KlJB8WtQn5DlZ9FLSaxLlIwfF+I+mc52ym5ZtayeZpfw0GMSb
 n3zVBvDk+xifuW1pmRt2u+VYlrHEjkCRvhD+lh1pexb4R6Ru5ncbuKw6txQu4ooI9ZGX
 SslhiaumBWhhyQZjIqogApKGhkTySd5MqgVfnp+6v9U2FkO/fQZyqJEFgny3K0s85NrI
 DNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ixZK3t92hTimbYbnCuhANOq5cLXlW8doOOAwoV7788=;
 b=drWfy16mTV/3iUDkHXrwB2GxxBv5co7SnFqdkD1ubJLtrgxvnD3/urHgFH5GGBN1hy
 QrITBNasUDsWBqELgMWcITx3wkK7Vk2+TVE5qijhT1/IcH+ysWgj1RoC/RMHjiNFKGGA
 Y0u5wkPK5zaa/SQYsiw2Zt6eCl0GcTfp/6lTK3tUlV7LI3wf2SbtqmpOd4zNM2A+Ok8A
 PnsESOCh5gTOzRWl2CrTAwLFGtPdg5Ls3yaMwG4bbmR0+9/SYZluWu2cxeaqLgBLE9oJ
 RQtbjpnrNIcJPSlRoXOMUIxxZomgmLOLfXrl9Fcg/AoxJ+I7JzcczMujbDZxH4Yfz1UL
 LQoA==
X-Gm-Message-State: AOAM533tIMQwsxw25qP1TbW9p84zuuOoGjwMcMJa12lz45OaFlVT25UE
 HR2Yz+ok37cTllSVCAsxlQo=
X-Google-Smtp-Source: ABdhPJzjQFIuFhyBrcfn55/f55oIasW+dWMf4J2zzskezAL9Mie3lFmS2uNRSrmNbbsDWcoSXWAPlA==
X-Received: by 2002:adf:b748:: with SMTP id n8mr3237332wre.133.1631690261004; 
 Wed, 15 Sep 2021 00:17:41 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id v191sm738067wme.36.2021.09.15.00.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:17:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 15/53] target/m68k: convert to use format_state instead
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
 <20210914142042.1655100-16-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2cf936f9-d06f-a847-3ae2-65476d5b34f5@amsat.org>
Date: Wed, 15 Sep 2021 09:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-16-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:17:51 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/m68k/cpu.c       |  2 +-
>  target/m68k/cpu.h       |  2 +-
>  target/m68k/translate.c | 92 ++++++++++++++++++++++-------------------
>  3 files changed, 51 insertions(+), 45 deletions(-)

>      switch (env->fpcr & FPCR_PREC_MASK) {
>      case FPCR_PREC_X:
> -        qemu_fprintf(f, "X ");
> +        g_string_append_printf(buf, "X ");
>          break;
>      case FPCR_PREC_S:
> -        qemu_fprintf(f, "S ");
> +        g_string_append_printf(buf, "S ");
>          break;
>      case FPCR_PREC_D:
> -        qemu_fprintf(f, "D ");
> +        g_string_append_printf(buf, "D ");
>          break;
>      }
>      switch (env->fpcr & FPCR_RND_MASK) {
>      case FPCR_RND_N:
> -        qemu_fprintf(f, "RN ");
> +        g_string_append_printf(buf, "RN ");
>          break;
>      case FPCR_RND_Z:
> -        qemu_fprintf(f, "RZ ");
> +        g_string_append_printf(buf, "RZ ");
>          break;
>      case FPCR_RND_M:
> -        qemu_fprintf(f, "RM ");
> +        g_string_append_printf(buf, "RM ");
>          break;
>      case FPCR_RND_P:
> -        qemu_fprintf(f, "RP ");
> +        g_string_append_printf(buf, "RP ");
>          break;
>      }
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");

g_string_append_c(), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

