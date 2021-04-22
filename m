Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZW3g-0006fb-DV
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 05:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZW3f-0006cn-AT; Thu, 22 Apr 2021 05:55:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZW3b-0008Vf-Sh; Thu, 22 Apr 2021 05:55:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso2782846wmi.2; 
 Thu, 22 Apr 2021 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j3/CD8iIg7DzJvo+u5RSyI4mS3KD0iDabXy6SoEOmWA=;
 b=ahUByVxEoyMyoyOclcLDZgox6hD6OI1LI1ONbBPRcLOLBfjNWIpDp/DyB1XZ7WTL4o
 k2J/xDpuCxYKp29nrmOMaAaBiVT4rqdc+l4q2t5N8j8wMBSUONs6s5lA6OPHF9HKXyiM
 psZNtjsgALZPEwP8dTewLnq/q/m7dWQLGr2idSfDuSaeMVQ7LOaRZU9N1xbmpG21pQDY
 s7VpBijqNkPGUmW6gj8yBeH9GNCRB8WdIzwvjFir4zfChlJ+TiGRd7QrqsxWKEsAPSnF
 sQOqn+lh4ONsZ6eezqlT6U8qjbvi0E46Q0wgnGWGy42MzgKEsqggt7RxKaKPvjKxPKPv
 xLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j3/CD8iIg7DzJvo+u5RSyI4mS3KD0iDabXy6SoEOmWA=;
 b=C8nMyu3CEVN5q1AYwweCJpLl4DySITRuEBQ15NXtoDJEY00xMU0DEcFv9jl4bWYqOu
 5IFFlJTVXH7LRFlM45KP9LdBxh7S9PO8ck25Hqb7kn1ERTT/1vcYp+8UBrb0cX1TRvZi
 eOU4Eyypzb9IhnUjrx01ea9ujkyV1mZRF+LF44PvM1ZIQhk6b8T83nBxPVwelocebh47
 0pq6SQz2m2q3BSVVjV0OpW00CTvpeQbQju3O4tHY1rmKVZ++Md+n4EDYzy909u7o04oe
 BoZb7NP8+Dbnk6oW+1QD/XFEC31UtWqmgHcwMcO2ZG7q1PWaCCAeNAwyFk3SLP6ZbcPf
 7xtg==
X-Gm-Message-State: AOAM531ZGWCW8Y1dsi/+ebJosxB3zTBFj7sWVgkiOhUKPrHkIbNTXSnL
 g06UE15Fuyteewv+nLHKCJY=
X-Google-Smtp-Source: ABdhPJz0dq2rFL5eVgEt52NmOoqYoFlJrfxA1xWcMFf4QAxKU7w+wcST5BfptlJL3he7lxkxgLxZmQ==
X-Received: by 2002:a05:600c:1546:: with SMTP id
 f6mr2824790wmg.156.1619085331620; 
 Thu, 22 Apr 2021 02:55:31 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t14sm2667543wrz.55.2021.04.22.02.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 02:55:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
To: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
Date: Thu, 22 Apr 2021 11:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421220333.bkxo6zriqe6w3rim@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 22 Apr 2021 09:55:39 -0000

+Juan

On 4/22/21 12:03 AM, Eduardo Habkost wrote:
> On Tue, Mar 02, 2021 at 03:57:52PM +0100, Philippe Mathieu-Daudé wrote:
>> The cpu model is the single device available in user-mode.
>> Since we want to restrict some fields to user-mode emulation,
>> we prefer to set the vmsd field of CPUClass, rather than the
>> DeviceClass one.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Is this going to have an externally visible effect?

On system emulation, no, because unchanged.

On user emulation migration it is not used, the symbol is here
to satisfy linking:

include/hw/core/cpu.h-1070-#ifdef CONFIG_SOFTMMU
include/hw/core/cpu.h-1071-extern const VMStateDescription
vmstate_cpu_common;
include/hw/core/cpu.h-1072-#else
include/hw/core/cpu.h:1073:#define vmstate_cpu_common vmstate_dummy
include/hw/core/cpu.h-1074-#endif
include/migration/vmstate.h:197:extern const VMStateDescription
vmstate_dummy;
stubs/vmstate.c:4:const VMStateDescription vmstate_dummy = {};

> If it does, how can we make sure it's safe?
> 
> If it does not, do you know why CPUClass::vmsd exists in the
> first place?

My guess is CPUState is the only device used in user emulation,
so it would be a way to restrict the vmstate_dummy to CPU and
not to any DeviceState?

But looking at the introductory commit:

commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
Author: Andreas Färber <afaerber@suse.de>
Date:   Sun Jan 20 20:23:22 2013 +0100

    cpu: Register VMStateDescription through CPUState

    In comparison to DeviceClass::vmsd, CPU VMState is split in two,
    "cpu_common" and "cpu", and uses cpu_index as instance_id instead of -1.
    Therefore add a CPU-specific CPUClass::vmsd field.

    Unlike the legacy CPUArchState registration, rather register CPUState.

Juan, do you remember?

> 
> Do you think it would be simpler to just squash this patch into
>   [PATCH v3 08/27] cpu: Move CPUClass::vmsd to SysemuCPUOps
> ?

Certainly cleaner, I'll respin!

Thanks,

Phil.

