Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jg8C5-0003AH-0b
	for mharc-qemu-riscv@gnu.org; Tue, 02 Jun 2020 10:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jg8C2-000387-L1
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2020 10:47:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37306
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jg8C1-0007a8-C9
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2020 10:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591109223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QeO0NXFyVX922zwxN8YmvHITMTh6VNjP3N1esX25vhM=;
 b=OjegDICYIxxKEL/JZoADGjJXl7tbPEDHOeIlqwsNoIR0PM4jriaSHlcneW0QdYsmfKvgAK
 w3q4v3GKfHp5ClcBsg9ubapGRO83U62ezgwULHehN4WekKgp6+RlOaC3mlR8jazQb6KwRi
 3Mi+xw/Bhlt9OL18RJ7Nl0dNwk+YGYE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-JOLv56SWNGasKjBdtrj3Fw-1; Tue, 02 Jun 2020 10:47:02 -0400
X-MC-Unique: JOLv56SWNGasKjBdtrj3Fw-1
Received: by mail-wm1-f70.google.com with SMTP id 18so946689wmu.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2020 07:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QeO0NXFyVX922zwxN8YmvHITMTh6VNjP3N1esX25vhM=;
 b=GcLGltjuqDMOsWuzcULW+dqB16RYcvlqqTEZ0XsSe+2aNdwr2iCceWlTZRLf3t7d6h
 awnHdolYrvTwqwrmhCt6zMKsFWSQn2FInSA3V5Sy2w4oHBEXTm/eInmNAHtcLONsVRsH
 eyDlG7A2EPW9fRISnZiKGSnp2JgXuoUnrXHWZdir/vDUrTU9Aj34wNsmsp7dWRh9/jIY
 AlwsU8dVVd0oUMBkfhgo2mah4Cv8l6OaB6b7ijZfztUHJxa8qGSL0NaItKsVT/23/59+
 KZEF8rgCk8f+yw7t7qsSleo0vnA/6uUGSAss6MPEUysq8rqwQRbFNlFCf36ghapSTUwB
 4OUA==
X-Gm-Message-State: AOAM530OAKwmsC9BPguSm9bbuf7wiSsUW1GY+LxgGGzClfM135V3fjzt
 eEiboj1LRmrjHpOT2BfVzH2jh02pSq1XpRmVDzNzfNQuqQZ9b1JGhXG0yQAEe38TbSIv0aw3HDh
 dhVG3UVuNrJe06NM=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr26462755wrt.322.1591109221144; 
 Tue, 02 Jun 2020 07:47:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF5auD96YZCMf7+9dWrS2WQ7U+eMGdgaMVnPgYIHVIkYunHBQmncA75BNloB/xQW/SWIi/Cg==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr26462733wrt.322.1591109220924; 
 Tue, 02 Jun 2020 07:47:00 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id u12sm4163809wrq.90.2020.06.02.07.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 07:47:00 -0700 (PDT)
Subject: Re: [PATCH v4 00/13] user-mode: Prune build dependencies (part 1)
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20200522172510.25784-1-philmd@redhat.com>
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
Message-ID: <71ea2e86-11e7-277c-9757-d4fc282e0787@redhat.com>
Date: Tue, 2 Jun 2020 16:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 03:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 02 Jun 2020 14:47:06 -0000

This series is now fully reviewed.

Laurent, as Paolo's misc-tree is already full, can it go via your
linux-user tree (as it improve linux-user at the end)?

Thanks,

Phil.

On 5/22/20 7:24 PM, Philippe Mathieu-Daudé wrote:
> This is the first part of a series reducing user-mode
> dependencies. By stripping out unused code, the build
> and testing time is reduced (as is space used by objects).
> 
> Part 1 (generic):
> - reduce user-mode object list
> - remove some migration code from user-mode
> - remove cpu_get_crash_info()
> 
[...]
> 
> Philippe Mathieu-Daudé (13):
>   Makefile: Only build virtiofsd if system-mode is enabled
>   configure: Avoid building TCG when not needed
>   tests/Makefile: Only display TCG-related tests when TCG is available
>   tests/Makefile: Restrict some softmmu-only tests
>   util/Makefile: Reduce the user-mode object list
>   stubs/Makefile: Reduce the user-mode object list
>   target/riscv/cpu: Restrict CPU migration to system-mode
>   exec: Assert CPU migration is not used on user-only build
>   arch_init: Remove unused 'qapi-commands-misc.h' include
>   target/i386: Restrict CpuClass::get_crash_info() to system-mode
>   target/s390x: Restrict CpuClass::get_crash_info() to system-mode
>   hw/core: Restrict CpuClass::get_crash_info() to system-mode
>   stubs: Restrict ui/win32-kbd-hook to system-mode


