Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPHM-0005UU-4L
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPHJ-0005NI-Tf; Wed, 15 Sep 2021 03:24:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPHH-0003Xr-E5; Wed, 15 Sep 2021 03:24:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1263654wms.2; 
 Wed, 15 Sep 2021 00:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zJNTPAwYTY5yl1zla+IICCjEhr1n1Evqv1zrZZxvAzU=;
 b=k9tAVtU+4iORp7MlEjIyWS+0R5oRpoEfNAuh3NWzVkM1gxRS9ib6DHDKEhB9NM2bOA
 hWeGJOH5FogFsWLqTFe8l1YAPBRYW20kxmqrypD05u0FuQpWK5PStPHOzYmHZPmpeHFF
 MZAPNgmVcmKi7dP5a4xBC06EEgZo1u59Eh+7xthEpVV+MzV1FxU5MEy2zqJZmyThcSjp
 8fmDZGpKPacNaehauYieMPs3zg+a5pGrtHdMXAhm2TpegtTTuIdl0ndGiD2A3MFjCLCb
 6Ze9LT8LO9Rpa6BJCdP74qIAqJV0QIGDllpKbLQnZ+UKBZ7PP7aMADLCmB8U5wym73H2
 239Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zJNTPAwYTY5yl1zla+IICCjEhr1n1Evqv1zrZZxvAzU=;
 b=jBq5VZ/YDieiaYWiK8WBQC3kYpEM316e0+Sm7EWO6FAGTNnMnkXam1R51PdbTg8Hua
 WHEFT0+RU0LMKUh5NvQJmJj5apduNSCQblZbnHSaedxvRlsg3DOUM317NZctkkFCEJtz
 zxpUAYd9ebONZGRPerBbMtDNUBpFLRvgbA9ibVaZz8id932OSBXvrQxa1F0z9dJdzwO3
 s0ysS5IcN9WRSMln8SOpb6VQfGgDa5jDGx2qP+Y2dti1/O4nBoxPOzDoAdzAUr7aWhY0
 3WkDzHPbOHJ7WR3LW33V8OVkzNb7h/jo/sjTrMUEdnZ7zzCCtOARuvh21kvzana7yDFA
 osDw==
X-Gm-Message-State: AOAM533xBZdYU9y7bP4gztOBHeCag/kSfbsxi9T7eTUizy6/FjFe9hxQ
 03IT2nUuAxbjFDWV3Tlnmpw=
X-Google-Smtp-Source: ABdhPJz2wdTYXjEJIb9Yxj+tW/V+QM92EtclvOsMoypR7R6XF9ibC7ACXr4Xxlzvlb3k4WYSbgHVBA==
X-Received: by 2002:a1c:2056:: with SMTP id g83mr2874452wmg.27.1631690654197; 
 Wed, 15 Sep 2021 00:24:14 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id o7sm3182960wmc.46.2021.09.15.00.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:24:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 24/53] target/sh: convert to use format_state instead
 of dump_state
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
 <20210914142042.1655100-25-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <107bd5d4-3f21-510a-a1a5-f589f8195cf2@amsat.org>
Date: Wed, 15 Sep 2021 09:24:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-25-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:24:22 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/sh4/cpu.c       |  2 +-
>  target/sh4/cpu.h       |  2 +-
>  target/sh4/translate.c | 36 ++++++++++++++++++++----------------
>  3 files changed, 22 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

