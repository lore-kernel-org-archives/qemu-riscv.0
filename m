Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKgaN-0001Py-J4
	for mharc-qemu-riscv@gnu.org; Tue, 22 Sep 2020 07:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKgaM-0001Mk-3V
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 07:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKgaI-00012U-KJ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 07:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600774545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVuM9z2yUr8zyxXYDwbwyPVDW6UrW4ow9wkAb6hmN1A=;
 b=IdCasDbB5I3yINNoIe57gd423VtZ1c8ErAIk9ObVFnwFUE9Ysd+hoy3Vzzh84Q/JdJXHZ5
 nGmIeMbWTjPoQMKc/N+yHrEiIndvwuRFWVN7qyqwHjFqVReVs6RIEuJK1hHcf5lHOH1+yc
 IbC6IfRrEyB3mD0Hh/0K7PUddt8D11E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-l39RLw7RMQGfdbKSNg7QFg-1; Tue, 22 Sep 2020 07:35:42 -0400
X-MC-Unique: l39RLw7RMQGfdbKSNg7QFg-1
Received: by mail-wr1-f69.google.com with SMTP id b7so7291033wrn.6
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2020 04:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iVuM9z2yUr8zyxXYDwbwyPVDW6UrW4ow9wkAb6hmN1A=;
 b=QsmAYqV5uldgE5ZesDaYeWx7pqItLQMIJ2BDKRCopqVfKDrLAxT5oJc6A/hVwoVZNV
 Voex0tTioeziAL+nV3U1Qlbu4SykwXJyGPNXRqAA9tyQbIN5t4kivr2Hy9zlizlH1Fyn
 h+TXRTWyJjPf3qmYKEwu/yUL+AdCVh5LkPCQ9+7zmaJ8sXTDDaPHtPhTTnuvl1UrS11z
 WNmhvDedv24q8aFCU1Jvv0YRVnyfdi1WSLV9m8Vnl1gWkNwm2FuqHk721RYQxSjh6AX9
 6dc+pWHmkXVt+/7WC3FcgOQJSfyWMVmXiaYH8P2RHMfWoLaBiXiS/dopbEUbgDvcNpgc
 4DvA==
X-Gm-Message-State: AOAM5339oy+6pa2gbQpXFalz2eMePouI7a8rGMcU0OdqO1e87rG8E089
 vw51fZTfCxdh+hBWM7JWRZgVE7H3xHlbduT46lseZPmrAS8eOg42sDvSTbnT0h/+gLO2VMOsr5W
 bBzAfhKDYAHzCDCo=
X-Received: by 2002:a1c:2c0a:: with SMTP id s10mr522303wms.103.1600774540943; 
 Tue, 22 Sep 2020 04:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRA5AQEUn4rCczYkkzXjxs49KTP7PwCp4IUjQhU4ZWgDSvFRTPtzciduuPsGxbrjwX11t5eA==
X-Received: by 2002:a1c:2c0a:: with SMTP id s10mr522238wms.103.1600774540651; 
 Tue, 22 Sep 2020 04:35:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ec2c:90a9:1236:ebc6?
 ([2001:b07:6468:f312:ec2c:90a9:1236:ebc6])
 by smtp.gmail.com with ESMTPSA id m18sm25626053wrx.58.2020.09.22.04.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 04:35:39 -0700 (PDT)
Subject: Re: [PATCH v2] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
 Peter Lieven <pl@kamp.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alberto Garcia <berto@igalia.com>, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, Liu Yuan <namei.unix@gmail.com>,
 Jiri Slaby <jslaby@suse.cz>, Fam Zheng <fam@euphon.net>,
 Paul Durrant <paul@xen.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Kevin Wolf <kwolf@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, sheepdog@lists.wpkg.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juan Quintela <quintela@redhat.com>, qemu-riscv@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Stefan Weil
 <sw@weilnetz.de>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <laurent@vivier.eu>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Huacai Chen <chenhc@lemote.com>
References: <20200922085838.230505-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <33631340-e3e3-b10f-4f9a-0e1b295d79ef@redhat.com>
Date: Tue, 22 Sep 2020 13:35:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200922085838.230505-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 22 Sep 2020 11:35:50 -0000

On 22/09/20 10:58, Stefan Hajnoczi wrote:
> clang's C11 atomic_fetch_*() functions only take a C11 atomic type
> pointer argument. QEMU uses direct types (int, etc) and this causes a
> compiler error when a QEMU code calls these functions in a source file
> that also included <stdatomic.h> via a system header file:
> 
>   $ CC=clang CXX=clang++ ./configure ... && make
>   ../util/async.c:79:17: error: address argument to atomic operation must be a pointer to _Atomic type ('unsigned int *' invalid)
> 
> Avoid using atomic_*() names in QEMU's atomic.h since that namespace is
> used by <stdatomic.h>. Prefix QEMU's APIs with qemu_ so that atomic.h
> and <stdatomic.h> can co-exist.
> 
> This patch was generated using:
> 
>   $ git grep -h -o '\<atomic\(64\)\?_[a-z0-9_]\+' include/qemu/atomic.h | \
>     sort -u >/tmp/changed_identifiers
>   $ for identifier in $(</tmp/changed_identifiers); do
>        sed -i "s%\<$identifier\>%qemu_$identifier%g" \
>            $(git grep -I -l "\<$identifier\>")
>     done
> 
> I manually fixed line-wrap issues and misaligned rST tables.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * The diff of my manual fixups is available here:
>    https://vmsplice.net/~stefan/atomic-namespace-pre-fixups.diff
>    - Dropping #ifndef qemu_atomic_fetch_add in atomic.h
>    - atomic_##X(haddr, val) glue macros not caught by grep
>    - Keep atomic_add-bench name
>    - C preprocessor backslash-newline ('\') column alignment
>    - Line wrapping
>  * Use grep -I to avoid accidentally modifying binary files (RISC-V
>    OpenSBI ELFs) [Eric Blake]
>  * Tweak .gitorder to show atomic.h changes first [Eric Blake]
>  * Update grep commands in commit description so reviewers can reproduce
>    mechanical changes [Eric Blake]

I think the reviews crossed, are you going to respin using a qatomic_
prefix?

Paolo


