Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQPE0-0007B2-NZ
	for mharc-qemu-riscv@gnu.org; Wed, 15 Sep 2021 03:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPDw-00078O-AO; Wed, 15 Sep 2021 03:20:52 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPDs-0000bX-OG; Wed, 15 Sep 2021 03:20:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1257416wms.2; 
 Wed, 15 Sep 2021 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3qeqKR4fqF0gull+t8oLNM9vYxJlHeWsjOdzitJTr4o=;
 b=Ie7/OSTLnKior9n38R5PTmAU2c5TDCytRhiw8vSWtq2D7HZceb5VhMLetzRsMGzzPD
 ZT5IC2J9a0lutQBwVRpJnlE60/lnNxV+OJg+aJhSDkAnQaeNWE70Q6b50shmpoHauc6I
 k4r+ObgmWakvP0ets8ZfjXjuA5UXRi+8j7xY9B1hS1nEYOVpWbfHdV7lQyX/XCh2nCUp
 Rmeb8ZYMri4/ATdog5yym3CxclRTz80be4vU39DT5tjby0Yahoz61z+zoMH8XETa6mmJ
 R2uCBmddMmWCe6jlu34Yt4tytZqxE+xfEYlx0WuafW6zCX4KrxmvRsv+uViEO1KAJ5ID
 aUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3qeqKR4fqF0gull+t8oLNM9vYxJlHeWsjOdzitJTr4o=;
 b=ruYr8gZP45Wf2KvJ7vpWs3IAQ91x1GqDxZVuN04S3ngOG2aKSIyop1tpqOGre2+EWv
 c78xF59sTWaWE6VppQTzrfDL6Q0DfGpblzVjhkyJGEG9Fw65na1DCSbx1tb6JoobY4rn
 +7rLpVi59nFxLu4C55/6j7wSb/e7n8HPevrWrcI9NVRUfErxgYcrci/HVQo2FPQF68wh
 4CExGA8GXNeXrOFHo8o7fv28sGfX7RUjnkOKTQCumMx1JV6DPv1oFHqVoTlIp3rHHJxr
 ka2ZmpaX3M5b/UWip+1Aei5WQ3Ab6HNqypYzUPkG0pOy5E4kTYYkhYh1zQ9qohr9d7L1
 jmkg==
X-Gm-Message-State: AOAM5335IkB1wlT/oFfRzcPnBY3kNTk0vYqwyFtrc3wz7b/4PlfM7tH5
 i5GaFtN4HjzB/lpqNgNS1L8=
X-Google-Smtp-Source: ABdhPJw7tbZpJx0kLTcgBLx+yJBjHkkD3MLJq/jKPEfWJ6of6e4i6LWFXxUJgsz7naNg3/F66UpSxg==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr695608wms.119.1631690444146; 
 Wed, 15 Sep 2021 00:20:44 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id o1sm2571397wru.91.2021.09.15.00.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:20:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 22/53] target/rx: convert to use format_state instead
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
 <20210914142042.1655100-23-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1cdb6d74-9db4-a6c1-2aaf-a3550d4f3923@amsat.org>
Date: Wed, 15 Sep 2021 09:20:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-23-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Wed, 15 Sep 2021 07:20:54 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/rx/cpu.c       |  2 +-
>  target/rx/cpu.h       |  2 +-
>  target/rx/translate.c | 14 ++++++++------
>  3 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

