Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiLiV-0004T4-8e
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 13:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiLiP-0004SI-TO
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 13:37:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44681
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiLiP-0000Ka-4p
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 13:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591637860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IaI75RxTU9jtVvOtNWo4VByTn1tODzTplByzyDcoNo8=;
 b=iabRwTaJBVG0hrKDj7zk4l1xsBtrGgoP1ChUlUisuNoTSeclW2w0Bz+BIqHKiBZp7uwr8S
 lHLPwDSaDcNzQ8JeM/aRfG+zRtyRasyFdHl1ovKJOpSErg/05ZWQ8MzQp2+ZXqK0lLLoeb
 /AA9dPcmHaAkDsMn8ODzSLlYb4Ixjms=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23--V_xRraLNCCW_e3ELimm_g-1; Mon, 08 Jun 2020 13:37:36 -0400
X-MC-Unique: -V_xRraLNCCW_e3ELimm_g-1
Received: by mail-wr1-f69.google.com with SMTP id f4so7454409wrp.21
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 10:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IaI75RxTU9jtVvOtNWo4VByTn1tODzTplByzyDcoNo8=;
 b=e5USUS+mgav5hhMPCkETLVdpKKGPLQbwrlI0XrRcknJ5vze2dVvfG61Cm0okfzaCsn
 TbbOO9SoM/YwUHpX3hWDVOFPzIeBs0YScCpmnVf5Esp21+MznH8ya0gksrjnkBsnNzfO
 N6lwmei9l9j4MLOFQ/JKugnV/zATee0GJowXChAjuhTInLNo1kZUoi2C21TioLKOG1ae
 9Bb6oM0ngTHeVpe2HNYIi8fpyVZXFQEC92PS1roo3aHxmBFrSg4AYgYebMH7GBDIIhzB
 hgeETI83vF9FycXv1XSjmwkyk/LqoU1Mj+ku/AEQFLcMC7NrrO/LT/USr6tECaB66JgN
 54KQ==
X-Gm-Message-State: AOAM533tx0BItEj7Ukkk5BMFP/SyHDWCN3QAEAzje3MaSmaHl5pf5NGp
 TNUA4P2XbUmXz3jEP7MyG8x/9bv7bJ3wwyE6riaxNts29vXVHAfZ0BWo+PcHJbjEs4RIoIImhrs
 /VANrtRbR2LFUGTM=
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr404337wmf.69.1591637855654; 
 Mon, 08 Jun 2020 10:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2PP8Jam0jrAYWvl6HUndlzbkmQydkF0EZCtZp+EtGb77Su/VpiOiSTjN4I5rK9hrbErrKaQ==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr404296wmf.69.1591637855427; 
 Mon, 08 Jun 2020 10:37:35 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z9sm214694wmi.41.2020.06.08.10.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 10:37:34 -0700 (PDT)
Subject: Re: [RFC PATCH 15/35] hw/i386/xen/xen-hvm: Emit warning when old code
 is used
To: paul@xen.org, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, 'Markus Armbruster' <armbru@redhat.com>,
 'Max Filippov' <jcmvbkbc@gmail.com>,
 'Marcel Apfelbaum' <marcel.apfelbaum@gmail.com>,
 'Peter Maydell' <peter.maydell@linaro.org>,
 'Michael Walle' <michael@walle.cc>,
 "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 'Aurelien Jarno' <aurelien@aurel32.net>, 'Gerd Hoffmann'
 <kraxel@redhat.com>, 'Stafford Horne' <shorne@gmail.com>,
 'Andrzej Zaborowski' <balrogg@gmail.com>, qemu-ppc@nongnu.org,
 'Alistair Francis' <alistair@alistair23.me>,
 'Richard Henderson' <rth@twiddle.net>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?=27Marc-Andr=c3=a9_Lureau=27?= <marcandre.lureau@redhat.com>,
 "'Daniel P . Berrange'" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "'Michael S. Tsirkin'" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 'Sagar Karandikar' <sagark@eecs.berkeley.edu>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'Palmer Dabbelt' <palmer@dabbelt.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Alistair Francis' <Alistair.Francis@wdc.com>,
 'Eduardo Habkost' <ehabkost@redhat.com>, 'Thomas Huth' <huth@tuxfamily.org>,
 'Bastian Koppelmann' <kbastian@mail.uni-paderborn.de>,
 'David Gibson' <david@gibson.dropbear.id.au>,
 'Magnus Damm' <magnus.damm@gmail.com>
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-16-philmd@redhat.com>
 <004b01d63db5$87a83110$96f89330$@xen.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <a14be45a-9296-c0ca-2b04-44703f2b9756@redhat.com>
Date: Mon, 8 Jun 2020 19:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <004b01d63db5$87a83110$96f89330$@xen.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 17:37:42 -0000

On 6/8/20 6:54 PM, Paul Durrant wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> This code hasn't been QOM'ified yet. Warn the user.
> 
> "Based on today's IRC chat, this is a trivial RFC series
> to anotate pre-qdev/QOM devices so developers using them
> without knowing they are not QOM'ified yet can realize
> it and convert them if they have time."
> 
> So, how should this be coded then? The XenIOState doesn't really qualify as a 'device', does it?

There is a pending question whether Machines are Devices or not.

Xen is a tricky case, it is created as a Q35 machine overloaded with Xen
features.

>> @@ -1401,6 +1401,8 @@ void xen_hvm_init(PCMachineState *pcms, MemoryRegion **ram_memory)
>>      xen_pfn_t ioreq_pfn;
>>      XenIOState *state;
>>
>> +    qdev_warn_deprecated_function_used();
>> +
>>      state = g_malloc0(sizeof (XenIOState));

XenIOState is indeed not a device, it is allocated once, we won't gain
anything making it a QOM object... so this patch is incorrect.

Sorry for the noise :S

Regards,

Phil.

>>
>>      state->xce_handle = xenevtchn_open(NULL, 0);
>> --
>> 2.21.3
> 
> 


