Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKcDv-0002jE-UA
	for mharc-qemu-riscv@gnu.org; Tue, 22 Sep 2020 02:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKcDu-0002fv-Hu
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 02:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKcDp-0003w3-NJ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2020 02:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600757772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdmGL0X3kZ623XBvGj6grePr2oGnneoqjceqFQ7hFKo=;
 b=at6z70HW5tCbgi3xJG5Q0Vf6k0pqi42z6kBqVe6XLBHmpKVn+z6+qzWHpmVyZVx3E7p3Ls
 fBlYwucAC7o6VSg3Y1RuqhzMDuleG+KDW96uLVPFL5LesF3+er8SORgOkzJldz1SbSYfer
 Ag/+jfP4G3O90amWlSoWgkSJeJn+L0o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-5upEJcc1Miur6CrMtbHcSg-1; Tue, 22 Sep 2020 02:56:10 -0400
X-MC-Unique: 5upEJcc1Miur6CrMtbHcSg-1
Received: by mail-wr1-f72.google.com with SMTP id g6so7027305wrv.3
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2020 23:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fdmGL0X3kZ623XBvGj6grePr2oGnneoqjceqFQ7hFKo=;
 b=ft2bZMrJPj5lZ4ozcxDyvuCnlz3TgfwvjulwiN5RcqtLhxOc/Dc3X0U66sPAFGOzik
 teThRZRKcGR3LlYsSE4vD0xY4Gz7xKvlMRdbMqsSVNtCU49Minxv7jUm0G9twvsOOp9g
 LpTkIyRCPNWAUilqB+cw2FN7rCehiNchcz6LsaAWRdf/wwfzJL4XFdN7erLEySbBxVVn
 pbIMW3bgmNRgnwYXXJUmse9gAHeVNS7ERchlBnuzuBSV8SGgk52EWiljAOEL/91Y6bvv
 9SkA7Mq3WR/LTsjxz/h2oJVW2KtbMDdAieSp89F8Q4NR07zYmX7nbavJZ9a10sAyd4iQ
 9KQg==
X-Gm-Message-State: AOAM5338jk7JSbX5UaxYaKLljTRBZDgohOdT3GaqUVsFeZ1guFFMTLqw
 VZP5+DaL1JLZPM+ShmZJ0r3y+/egxB0zuGMU4WNQrfv82Cp/PTMS78xsQc9yfVeVGg7dBPgP0Ky
 61iNXrVAdWG3qPpM=
X-Received: by 2002:adf:8187:: with SMTP id 7mr3658798wra.266.1600757769266;
 Mon, 21 Sep 2020 23:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKFFt/QRb04H8kSIfdQ5jqG5B6jsQvAnc25MIGryjLgYDuFqTx9G3VVN2PDZNnPRD+beCn4A==
X-Received: by 2002:adf:8187:: with SMTP id 7mr3658757wra.266.1600757769000;
 Mon, 21 Sep 2020 23:56:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d153:8d0f:94cf:5114?
 ([2001:b07:6468:f312:d153:8d0f:94cf:5114])
 by smtp.gmail.com with ESMTPSA id g131sm3054048wmf.25.2020.09.21.23.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 23:56:08 -0700 (PDT)
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
To: David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alberto Garcia <berto@igalia.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>, Peter Lieven <pl@kamp.de>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
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
 <c8892b73-6cee-9fd3-54b0-289149926041@redhat.com>
 <52b8a46e-ab9e-1645-163d-497122ece907@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8610ca0e-0b3f-6d95-43b9-e2e49571e311@redhat.com>
Date: Tue, 22 Sep 2020 08:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <52b8a46e-ab9e-1645-163d-497122ece907@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 00:31:51
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
X-List-Received-Date: Tue, 22 Sep 2020 06:56:22 -0000

On 22/09/20 08:45, David Hildenbrand wrote:
>> It's certainly a good idea but it's quite verbose.
>>
>> What about using atomic__* as the prefix?  It is not very common in QEMU
>> but there are some cases (and I cannot think of anything better).
>
> aqomic_*, lol :)

Actually qatomic_ would be a good one, wouldn't it?

Paolo


