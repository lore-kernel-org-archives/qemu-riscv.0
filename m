Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPCv-0006M2-Nn
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPCs-0006H5-Tn; Wed, 15 Sep 2021 03:19:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPCr-0008FI-Ev; Wed, 15 Sep 2021 03:19:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3284691wmh.1; 
 Wed, 15 Sep 2021 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zhl7XZLa3NLEzML11pu0eOLiT+/ZeE3zNkXX1raPI1I=;
 b=UdyCT0Zf8zUessWPf88r5upiBAWYfku4d2VX3bgeiuFpQ/WFmY5K4aHHMrCX45ez6Y
 ASVVSRziA21JcAqm8dXoclyo76yV47d3A9M32i63/auIWayQdPP4pFL5vQ7780splBrT
 kq3+fGWUPboerCMqCs7thoCqg5jGQi/79LH/X9701fmn3HfHJ+dUiFrxSCOHB3KBpx6G
 fFtZboBXAZj1mmGse4lfXoQVZ54ERYPAYZhny62IA7P3M2S7Pj/OI/jrx3rD6hv6+52n
 begwFg248LUwT/1q4icij6tzDFuP/5sRBAfZb20wKmLI0P7LUrycGXK1TJfb5gfTbE0Z
 VGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zhl7XZLa3NLEzML11pu0eOLiT+/ZeE3zNkXX1raPI1I=;
 b=sVRRRmbcCTmedjohJu8KIhH4903Smr1oXOUI7PKuAmMS53BzrHWWIpqw1bfyWSDq3E
 1dhDZlCN0nLpNb0CQCyp3kzRHrQ2HAddtXLcfQbGJ5b+DP3fSHdRoeOqU1LEIVZO17lN
 4kMGIeOq1NEAyMzt4pWOXEd9GM0CzIb+29FrC9ZE1qTY2whxJTNBb1iozMAfYhbHfFM1
 umSvFvjXqe8ik9YnNDdmh2aLaTB23IYwRm0yidnfSgcFzi+trJEWq2iNWmxZ9lVjhEC7
 2OeMH/DjGQGRjHnMl/waKfC6R9V/THspPWNNiPpZoMJo+DsYIyJEEImg5+hnwahdWax3
 AAuQ==
X-Gm-Message-State: AOAM5314mO2OaNA0uCt32qxDE1lhuyWCBYW8B6Mg0+u1Gra9vnCWpUxo
 fqXr7uM1ADYkOGfvWc5EvV4=
X-Google-Smtp-Source: ABdhPJw8mOtSKVHTDBXK55kbC8KiMdqpl8YOlvlMi8KmlnVr/To9ME2+uofGDQWZoug/mFQqs1RBQQ==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr2993118wmi.10.1631690382162;
 Wed, 15 Sep 2021 00:19:42 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id k1sm12587171wrz.61.2021.09.15.00.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:19:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 19/53] target/openrisc: convert to use format_state
 instead of dump_state
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
 <20210914142042.1655100-20-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a140dd4b-a99f-1d3a-bcf3-38096e52c811@amsat.org>
Date: Wed, 15 Sep 2021 09:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-20-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:19:47 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/openrisc/cpu.c       | 2 +-
>  target/openrisc/cpu.h       | 2 +-
>  target/openrisc/translate.c | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

