Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKblp-0005NB-V4
	for mharc-qemu-riscv@gnu.org; Tue, 22 Sep 2020 02:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKbll-0005M4-1q
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 02:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKbli-0000ZH-41
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 02:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600756032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7G+bCvhy95HPHxeoyKaN/sNOB4HyNxDqXvDdb+Os9oY=;
 b=aAS3Q0pyrjCEqjf5IfCNafrX2LTnX6H0z4j1wkzr7tn9hH2NYeICC7WqAeqcMokx+c/d2X
 IacchlR2xuxttmwXTmcnc2LYLxSQiy9GVQZHuOm/zGZdNblxptnKOp9AZjPDBfMpxvpZKw
 ostOgm5AZQyQ8LRNXuTlOBd77xwevQM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-Y2bwb-ccPYuK4CW8Lw25ZQ-1; Tue, 22 Sep 2020 02:27:11 -0400
X-MC-Unique: Y2bwb-ccPYuK4CW8Lw25ZQ-1
Received: by mail-wr1-f72.google.com with SMTP id v5so6919696wrs.17
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2020 23:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7G+bCvhy95HPHxeoyKaN/sNOB4HyNxDqXvDdb+Os9oY=;
 b=iC52jezOhDVxAoaO7vsYXfi3mtZT3g6+evKO20+cpMXpBocCB3Hw519Gyr1OQ+23h6
 HmzPsjv/9rXQhDsMtkSgPUn3lVhOHgHnqlKxuwfMTVIZAyy7AHKlbXB2uXJL1YN2U46B
 sPBfnWM/w3N4XTyxU61IYlfXmAwJZNhQnCaDjzIxnUcLSe16MdZA/8q0Z26V2B3XqEBh
 yM/aPyjC4eIVw+/X/jCbvzXHA7ACCa+U0DnF3qAuRx9lpI1eiT4dlzkEXTj3KIOkP0Xz
 RQdIujMQNFCsRk6wtSDy44Dq/Rhj9PcTXoLKYpifu5d6Ce20aBX2EiPy++6nqD4JnLLm
 kc7g==
X-Gm-Message-State: AOAM531mtVL6LPcVFxclPaK4DwaepUjT4tTjPgECeSxsKxZKap7Bh1WA
 cnOAr9Il90n9gNQ1yydxoP94Ce7lDF6HwanKj9eq3VA7FTeXOma21ZZk++MaMRZox8y1jJl4DBw
 xeXgnaJxogarhbys=
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr3417827wrr.406.1600756029828; 
 Mon, 21 Sep 2020 23:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7ORFOE+M4sZ1/hLsOYfDXOsipaSc5O+Pi6m5A0EYwqbK9SJpJMOv6iyB5CnFMJ42wvwz7zg==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr3417755wrr.406.1600756029493; 
 Mon, 21 Sep 2020 23:27:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d153:8d0f:94cf:5114?
 ([2001:b07:6468:f312:d153:8d0f:94cf:5114])
 by smtp.gmail.com with ESMTPSA id a83sm2892268wmh.48.2020.09.21.23.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 23:27:08 -0700 (PDT)
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alberto Garcia <berto@igalia.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>, Peter Lieven <pl@kamp.de>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 kvm@vger.kernel.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Liu Yuan <namei.unix@gmail.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Jason Wang
 <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 xen-devel@lists.xenproject.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 sheepdog@lists.wpkg.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
References: <20200921162346.188997-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c8892b73-6cee-9fd3-54b0-289149926041@redhat.com>
Date: Tue, 22 Sep 2020 08:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200921162346.188997-1-stefanha@redhat.com>
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
X-List-Received-Date: Tue, 22 Sep 2020 06:27:21 -0000

On 21/09/20 18:23, Stefan Hajnoczi wrote:
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
>   $ git diff | grep -o '\<atomic_[a-z0-9_]\+' | sort -u >/tmp/changed_identifiers
>   $ for identifier in $(</tmp/changed_identifiers64); do \
>        sed -i "s%\<$identifier\>%qemu_$identifier%" $(git grep -l "\<$identifier\>") \
>     done

It's certainly a good idea but it's quite verbose.

What about using atomic__* as the prefix?  It is not very common in QEMU
but there are some cases (and I cannot think of anything better).

Paolo


