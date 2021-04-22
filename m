Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZWaO-0005Vn-RG
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 06:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZWaN-0005Sg-Ix
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 06:29:27 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZWaG-00033F-8G
 for qemu-riscv@nongnu.org; Thu, 22 Apr 2021 06:29:27 -0400
Received: by mail-ed1-x52c.google.com with SMTP id j12so27782624edy.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Apr 2021 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UHxPjnxttbob6OxFrZEVS4alJOCFPczXFHQ62igP+RI=;
 b=SkaLH8d0N3mLQvGr7a0SX5+oV8SjCvZbFzepJYgekCPfAzupljT9J2XOnjgnOKCMTk
 HZ0Msg9cPpLQjgV7BrRajymUtLErpYVnsaPTOGggb93ytVTizcaa2pR+uxMe9qv42dsp
 O/E/v5v782ubmagqNI1qCnKXYFIUUYzFFAmWsHMACkMX9ZgRy7vQLsK1Cxaz9IqvvT2D
 6vAejzKisa+0sWN5yb1qDFteK95gngxYxk4j+fWgavZ13wm5S4K/ofBai42SQ66dzJWV
 X4RK+A3XAFPnBbAW3As0v+qoJe9HywLCufgucHmtLAzMBMZOrgwn/kFDYMgbHNSJpVem
 U6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UHxPjnxttbob6OxFrZEVS4alJOCFPczXFHQ62igP+RI=;
 b=nqZAZhJi68KLEfUU5qE1HbQ1QftDfPOfSXqlXz/z9lH8zDfT6W//auUmTmMnbm8NfW
 4dILdDBsJ2uRY038LK9UPAntSVXxm4JxTIvmE7qOVA5NEkNRvMmYqWjU32BWgV8IKAky
 BrXcBALZYAdEf1WHTAGsjGqbhcChmKv0JYzq+zDD6dq1YSoRUV3hscLLPl6vwVMT4vB0
 bAVmA8DwNq9neC5JLM7xZ1kg/fV9wSKMwoOtf3tHtHy08/kELolwxD1C7CcjYjNEByNL
 N13ondxH4cR+wKXi9B6K4qeMYY3thBjnWLoDORF2jj3KNOPbfCE+ddCdyLwhgm1HryLk
 zFeg==
X-Gm-Message-State: AOAM531WVZhyEK8QP+LPq+6HAFsOpdhiDR1VqesjOysIVIuzsVGj//WY
 +qB5+yq6Xq49ceGq+jXqzEO98Hh2MyXzNEQy3bbtaw==
X-Google-Smtp-Source: ABdhPJyZ+mWndWINDeyUfVpYBZWtrdmN+lXk8txlk+n5SoVcAQaEyP5O1zB79SqKqK9tJjQTGYM+zhc5itDhOcJJef4=
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr3012452edq.146.1619087358385; 
 Thu, 22 Apr 2021 03:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net>
 <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
In-Reply-To: <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Apr 2021 11:28:23 +0100
Message-ID: <CAFEAcA8_cjzAzoA9BFucR7LzQA7KXnrmufH4kp7aNL9bo_5Q5A@mail.gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Sarah Harris <S.E.Harris@kent.ac.uk>, 
 Chris Wulff <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, 
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 22 Apr 2021 10:29:27 -0000

On Thu, 22 Apr 2021 at 10:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> My guess is CPUState is the only device used in user emulation,
> so it would be a way to restrict the vmstate_dummy to CPU and
> not to any DeviceState?
>
> But looking at the introductory commit:
>
> commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
> Author: Andreas F=C3=A4rber <afaerber@suse.de>
> Date:   Sun Jan 20 20:23:22 2013 +0100
>
>     cpu: Register VMStateDescription through CPUState
>
>     In comparison to DeviceClass::vmsd, CPU VMState is split in two,
>     "cpu_common" and "cpu", and uses cpu_index as instance_id instead of =
-1.
>     Therefore add a CPU-specific CPUClass::vmsd field.
>
>     Unlike the legacy CPUArchState registration, rather register CPUState=
.
>
> Juan, do you remember?

Oh yes, I remember this. There are two ways to handle migration for
a CPU object:

 (1) like any other device, so it has a dc->vmsd that covers
migration for the whole object. As usual for objects that are a
subclass of a parent that has state, the first entry in the
VMStateDescription field list is VMSTATE_CPU(), which migrates
the cpu_common fields, followed by whatever the CPU's own migration
fields are.
 (2) a backwards-compatible mechanism for CPUs that were
originally migrated using manual "write fields to the migration
stream structures". The on-the-wire migration format
for those is based on the 'env' pointer (which isn't a QOM object),
and the cpu_common part of the migration data is elsewhere.

cpu_exec_realizefn() handles both possibilities:
 * for type 1, dc->vmsd is set and cc->vmsd is not,
   so cpu_exec_realizefn() does nothing, and the standard
   "register dc->vmsd for a device" code does everything needed
 * for type 2, dc->vmsd is NULL and so we register the vmstate_cpu_common
   directly to handle the cpu-common fields, and the cc->vmsd to handle
   the per-CPU stuff

You can't change a CPU from one type to the other without breaking
migration compatibility, which is why some guest architectures
are stuck on the cc->vmsd form. New targets should use dc->vmsd.

thanks
-- PMM

