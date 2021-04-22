Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZX5K-0005TP-LG
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 07:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZX5J-0005QU-1J; Thu, 22 Apr 2021 07:01:25 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZX5H-0004NP-3O; Thu, 22 Apr 2021 07:01:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id j5so43373483wrn.4;
 Thu, 22 Apr 2021 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E3fJfYcVBlMBjDpfIPIQva/pCx7ym+slz7QaNgW03qo=;
 b=rBcp9MlO5dP644dANBloyJlIL7ogQQK9q2PcKCRuJhYS0i0SCqYIa3ceB/thIIKRZx
 KswQQl5QJddGbIzqyjmDebtMu4NjfPQKu5rFrBeLRHwWbOlQGKLVlABnUEoI0Sl/4iFS
 LfuMiEStwGuoohHQZamg1zV/P2d5xKU3zirSxZd0H9Yg68d7maJjgWHALwR8zAJMdRri
 CrBWFOD6FZfZKLZlcnjoBOHNHoEjvyLQpPRN4+P+Cs7UNidNH2PQRt2eAwS0Rjzf9YpJ
 k3kmk++DpEJNXfJfddbP8Qu3yUon7XXQcGEvGMQQp41ik0eAl5QjPzdkAmaobnWGPToL
 0PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3fJfYcVBlMBjDpfIPIQva/pCx7ym+slz7QaNgW03qo=;
 b=ci+tdt4uTfBt3bVGrLpz7lV/1iskqwa09D6noMTC/KpJsI5zDgVlsArQ+LiZ0xjq7J
 L5Cgcav+WJ7p63sWj4b2UWTLzsowwn9bRTWg9Nn4mVXU7ivX7bhe6EvnWIhKv2EQl8dI
 GUa8+tiGCBvfNBVMAbuwbpkxvSRei5800No9YwQF54Ru7THDXXl2ZjOXowKKeOAA4Oqh
 DYn6oumhWU9Sxl4wUdb40Kxn7NZopY+xoO6xp2zQhbeSejcV7LhSsMxoQV1MbtBO84jj
 liEi/Qla03jSdO97arEnpnOgPo5SmTlupAbTIci4NCXY7/gsCqXv67YcUn0/JsLEUJmt
 /pLw==
X-Gm-Message-State: AOAM533j7DylNMCKw1Vjwk3EdjE3qAQFreuXqFyVkXi9E78paNXpQl2R
 Hs9BxbGSm0pfvsqcPh8JGN0=
X-Google-Smtp-Source: ABdhPJyBYnqr1wO7q0rC71gF5ebDy0zEL3YMtVZsRttqCVtY8O+oyLH27KbCiAwPXscrXoIL6oEEBg==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr3485013wrq.396.1619089280348; 
 Thu, 22 Apr 2021 04:01:20 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n9sm3061046wrq.86.2021.04.22.04.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 04:01:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net>
 <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
 <CAFEAcA8_cjzAzoA9BFucR7LzQA7KXnrmufH4kp7aNL9bo_5Q5A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6bfaaaab-8045-d8be-4edd-652d500a6c14@amsat.org>
Date: Thu, 22 Apr 2021 13:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8_cjzAzoA9BFucR7LzQA7KXnrmufH4kp7aNL9bo_5Q5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 11:01:25 -0000

On 4/22/21 12:28 PM, Peter Maydell wrote:
> On Thu, 22 Apr 2021 at 10:55, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> My guess is CPUState is the only device used in user emulation,
>> so it would be a way to restrict the vmstate_dummy to CPU and
>> not to any DeviceState?
>>
>> But looking at the introductory commit:
>>
>> commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
>> Author: Andreas Färber <afaerber@suse.de>
>> Date:   Sun Jan 20 20:23:22 2013 +0100
>>
>>     cpu: Register VMStateDescription through CPUState
>>
>>     In comparison to DeviceClass::vmsd, CPU VMState is split in two,
>>     "cpu_common" and "cpu", and uses cpu_index as instance_id instead of -1.
>>     Therefore add a CPU-specific CPUClass::vmsd field.
>>
>>     Unlike the legacy CPUArchState registration, rather register CPUState.
>>
>> Juan, do you remember?
> 
> Oh yes, I remember this. There are two ways to handle migration for
> a CPU object:
> 
>  (1) like any other device, so it has a dc->vmsd that covers
> migration for the whole object. As usual for objects that are a
> subclass of a parent that has state, the first entry in the
> VMStateDescription field list is VMSTATE_CPU(), which migrates
> the cpu_common fields, followed by whatever the CPU's own migration
> fields are.
>  (2) a backwards-compatible mechanism for CPUs that were
> originally migrated using manual "write fields to the migration
> stream structures". The on-the-wire migration format
> for those is based on the 'env' pointer (which isn't a QOM object),
> and the cpu_common part of the migration data is elsewhere.
> 
> cpu_exec_realizefn() handles both possibilities:
>  * for type 1, dc->vmsd is set and cc->vmsd is not,
>    so cpu_exec_realizefn() does nothing, and the standard
>    "register dc->vmsd for a device" code does everything needed
>  * for type 2, dc->vmsd is NULL and so we register the vmstate_cpu_common
>    directly to handle the cpu-common fields, and the cc->vmsd to handle
>    the per-CPU stuff
> 
> You can't change a CPU from one type to the other without breaking
> migration compatibility, which is why some guest architectures
> are stuck on the cc->vmsd form. New targets should use dc->vmsd.

Doh I just post v5. I guess I'll have to revisit patch #7, because
I likely blew type 2 migration:
https://patchew.org/QEMU/20210422104705.2454166-1-f4bug@amsat.org/20210422104705.2454166-8-f4bug@amsat.org/

