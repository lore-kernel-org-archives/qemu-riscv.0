Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZbpY-0005Ek-VR
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 12:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZbpW-00059I-Ec; Thu, 22 Apr 2021 12:05:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZbpU-0000G6-O7; Thu, 22 Apr 2021 12:05:26 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so3558364wmd.3; 
 Thu, 22 Apr 2021 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n5NqJLJyYGIoXsiqv08wQ7Fl4jfG5oa9bCV2tUFpk6Y=;
 b=NBtYdWMqdOL3X7Bx+Kl08/i3MPf9k/twkDC3IN3FzAbaHrjzM1X0WPnUPmq1+m0wGW
 NX+9/8t+xsKnsMv5gfQqIaSOiU1+a+bwiyTF2gh+vlotNBpRL8FYIO60UtR+q/H6Q+1U
 vrI+rRCeroDle4PDl5eIa//AJZLC0UsQs89S+amj5vXXgmCctQXvrVdez5igEsKoCmfq
 Xmr2O/BpGkGsPHxtlAierbo8Rn7xLZuTbYj6bputqVp91NdTbvNqv04s/j+MllC2c7N4
 0+v3G+C2fCn36uRpvt4AGFZI9uy9QCv8YHv//Ce3g2idOU87sh5gubhqzqmEWPJGG0Nw
 p9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n5NqJLJyYGIoXsiqv08wQ7Fl4jfG5oa9bCV2tUFpk6Y=;
 b=eXoqWbsSUAnl9SUYzJClITuPhlmY+GkVmXtDRp1cM4heL0YRJURJl0T38jcRUMIpdi
 82fRb2v/QZxYiiXH0ojVXF2Syg0tejcyZQQKg4iubBYEc/fTunnTslZtaP7SDu2ptLoh
 ZiCdxRKeKl6hCDT7+2XmrtFeUvrndyKWbFtfA98cJO4aOWxk4DvAZZB1lctR+jhVB6F1
 SbU1aZQeeE0K6fnNUuUbeETYJPn6iZVmcQPUnOZDzX4ucuCli0LkA686zt7lxoGDgWuI
 dZOvg8n8/q+ppFL3RR7bv5ZJr1IW3TgZFEK5cGaid31lGuaw9CZ/c+8pznWhulmuHl5W
 zLCw==
X-Gm-Message-State: AOAM5315kMOaftYohSoGlU26VK1G93JIFBGdg0PNAt9pCL0ozZciGKWs
 SxKFKFB0z2AsHxW5IRvNzoc=
X-Google-Smtp-Source: ABdhPJyKS3vzm0R62NRXZ0MczPd0sRUNXqOjDDmXGhHwyfUVo0yaqyvTkc114cn+PHw8AP9sSDMxhw==
X-Received: by 2002:a1c:87:: with SMTP id 129mr764044wma.131.1619107521577;
 Thu, 22 Apr 2021 09:05:21 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o17sm4707258wrg.80.2021.04.22.09.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 09:05:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net>
 <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
 <CAFEAcA8_cjzAzoA9BFucR7LzQA7KXnrmufH4kp7aNL9bo_5Q5A@mail.gmail.com>
 <6bfaaaab-8045-d8be-4edd-652d500a6c14@amsat.org>
 <280abf24-4e72-78ed-621b-b66495943003@amsat.org>
 <CAFEAcA867BoyAEDfHB8eCXN12X58XBan_v-PzBKLvBK-o=XZDg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <02d18aea-4ee2-fe00-ecf9-5a81c7e02a11@amsat.org>
Date: Thu, 22 Apr 2021 18:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA867BoyAEDfHB8eCXN12X58XBan_v-PzBKLvBK-o=XZDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 16:05:26 -0000

On 4/22/21 5:53 PM, Peter Maydell wrote:
> On Thu, 22 Apr 2021 at 16:41, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> IOW new targets should use type 1.
>>
>>
>> Looking at type 2:
>>
>> a) targets added 'recently' with the incorrect type 2:
>>
>> target/avr/cpu.c:216:    cc->vmsd = &vms_avr_cpu;
>> target/riscv/cpu.c:627:    cc->vmsd = &vmstate_riscv_cpu;
>>
>> b) targets where migration isn't really an issue:
>>
>> target/lm32/cpu.c:244:    cc->vmsd = &vmstate_lm32_cpu;
>> target/moxie/cpu.c:125:    cc->vmsd = &vmstate_moxie_cpu;
>>
>> c) targets where migration could be broken:
>>
>> target/mips/cpu.c:723:    cc->vmsd = &vmstate_mips_cpu;
>> target/sparc/cpu.c:892:    cc->vmsd = &vmstate_sparc_cpu;
>>
>> d) KVM targets ("security boundary" or Tier-1) are left:
>>
>> target/arm/cpu.c:1985:    cc->vmsd = &vmstate_arm_cpu;
>> target/i386/cpu.c:7434:    cc->vmsd = &vmstate_x86_cpu;
>> target/ppc/translate_init.c.inc:10923:    cc->vmsd = &vmstate_ppc_cpu;
>> target/s390x/cpu.c:520:    cc->vmsd = &vmstate_s390_cpu;
>>
>>
>> Isn't "machine type" what allows us to change migration stream?
>> All targets in d) do support that.
> 
> Versioned machine types allow us to change the migration stream
> if we do it in a forwards-compatible way (and if we're feeling
> kind to RH as a downstream perhaps even backwards-compatible);
> but new QEMU still has to be able to read the migration stream
> produced by old QEMU for the "virt-5.2" board, or whatever.
> 
> In some cases I think we also like to maintain migration
> compat on a "best-effort" basis; I think Mark likes to handle
> the SPARC guests that way.

What I don't understand if is there is a possibility to eventually
remove the CPUClass::vmsd (even long and painful), or if it is
directly impossible and we are doomed to keep maintaining both.

