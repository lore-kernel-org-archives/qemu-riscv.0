Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPCA-00050W-Ap
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPC8-0004xJ-EF; Wed, 15 Sep 2021 03:19:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPC3-0007ad-0M; Wed, 15 Sep 2021 03:19:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id q26so2197226wrc.7;
 Wed, 15 Sep 2021 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lxqks9hN8p6vJMT6A0n9FtHBxpUq7EEMYkl2tekM3o0=;
 b=jvxWtztziTkC06llosazUdDK85mqxv70EuwXcZdlnUuP+hXKa0/JFnc80BK5Y+elgy
 9y3qSTQN21SHdZvXbhSurNw8a6Z1sXop8GogJ3pFO4INVouCiiCVrquFRUbWXodsFiAc
 2Z8r4DgthNHgvgAaDu6y3CBwgKZFnj0rWUfDLaKP4y8s/gbkUkX7/yoxg0Q6ODLiFKjG
 D03gB+l0PcpNiaWQ8Kgan4yyDfgAvSf6tiYoUGw22TxY9EUym1IXuaaT0cexJFXWntN1
 sB5urYa4O6Y2BAR2ujJZu268E9popFxeBN7LuHG56GqCMPc8RFQSr9Joc9Xe4gyCr6hx
 VuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lxqks9hN8p6vJMT6A0n9FtHBxpUq7EEMYkl2tekM3o0=;
 b=TFeu/+xLhDQwQ99TDBd+AXILyHYlZ2PtIBN3nglVxWdfEVuSKi1QO+73j4je2Afv9T
 1QOOkehKCb2KCBcMWYppKfRP6QHqGcFQAqypbalUfUM2qV4+CY7GUWNqbavZckyoNluL
 xSladH5rlW+gGM0ksaCwmA/mnMeBmwEMjgk4ZCZvsbWXe4JfR5L7jbE38oP33WZEo7wh
 wPOBvdqbxIi+wJdpJZNRGdNlyzpBTRYJdaSBebIxajd09L2DUaP09Xx///t8YuhVI+TD
 KXtgHsRZP5m9Q2VUwo6+fxu2plOHLKuZz9lkmCadGvFJLIioC6FtQcFb3GoQASHnXy3c
 Px0Q==
X-Gm-Message-State: AOAM530/bPtkB66UqTqni9fGebU3L0vNb4wFjjYj4EciIfmTGMc5BJik
 gRe5w0sy0fKEU8K9OUSgh6I=
X-Google-Smtp-Source: ABdhPJwCEX0rAOnC5GYV7iTT0QWnvgSmZuKzrKTCCn7PKz0bMFQnVLKY76U0VTdhxYK65LEyYtuMew==
X-Received: by 2002:a5d:58c9:: with SMTP id o9mr3323687wrf.279.1631690332130; 
 Wed, 15 Sep 2021 00:18:52 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id z6sm3434468wmp.1.2021.09.15.00.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:18:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 16/53] target/microblaze: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
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
 <20210914142042.1655100-17-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21032bce-bdbb-1a0f-f5a5-71350ad79c85@amsat.org>
Date: Wed, 15 Sep 2021 09:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-17-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:19:00 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/microblaze/cpu.c       |  2 +-
>  target/microblaze/cpu.h       |  2 +-
>  target/microblaze/translate.c | 45 ++++++++++++++++++-----------------
>  3 files changed, 25 insertions(+), 24 deletions(-)

>      for (i = 0; i < 32; i++) {
> -        qemu_fprintf(f, "r%2.2d=%08x%c",
> -                     i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
> +        g_string_append_printf(buf, "r%2.2d=%08x%c",
> +                               i, env->regs[i], i % 4 == 3 ? '\n' : ' ');
>      }
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");

g_string_append_c(), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  }
>  
>  void mb_tcg_init(void)
> 

