Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mt9Rg-00069s-Nn
	for mharc-qemu-riscv@gnu.org; Fri, 03 Dec 2021 09:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mt48r-00033c-Du
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 03:42:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mt48n-0003oR-4K
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 03:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638520919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GZB4B1N+7654kHtpQfNF47RaDJVwe0bhDq5s6FRHyg=;
 b=RKnk/VC+UB4KX6FRQdz9/0Ei49OMNuOB82OgJiYQzA6jZ9cQox+b0k+2mdKYrihUYLpAAS
 DlaEmnnBEkmxe/Q4g/SBlHV3FzDYMp4J1k1SA70/iETNQRiKWWkQHvww17zoU2F4+TUm+o
 4Sxb50AADVSJNwltxnrr697Tgf9A1Bg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-gpClPUwJNE-G-1G9cUKFbw-1; Fri, 03 Dec 2021 03:41:58 -0500
X-MC-Unique: gpClPUwJNE-G-1G9cUKFbw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w5-20020a05640234c500b003f1b9ab06d2so1943242edc.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Dec 2021 00:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6GZB4B1N+7654kHtpQfNF47RaDJVwe0bhDq5s6FRHyg=;
 b=js2qP3MY+C8WO4IzG7IyEAOrnGAFW+MRupd9WkIPIMw9bc4Y0TTWLtfuqoEqyo4vEF
 XXWoc/NBv2Sy2VJdYKM/BY2aX8m+dl2mYv2+6Td9wEr0nSeOHILlTVxSlnWWNXeNDbb7
 gfohS0UIPhYA8NBZMJMIh6MbjSB8qMNxgQ0knxzUO81YSByalIBbReMlYH+LxuaITuYX
 cU+h1g3vqSmRJVSMXQXHeZnz2alJDVBFbo8Jj7exLZWSAbwa9n1M5Wh34Xu9/nVp4O1A
 7SY+ZbKNdaD+o2ESBVN0oxWy+F7Hl0/IWZE+HxbKv8OuUoK+2y1vQvQTQB46KabMuWOD
 /NZQ==
X-Gm-Message-State: AOAM5307dlbNZdCBbMuLfJ85ubslrzK/UiolNzoKx2oHDGr+qOn0Qr16
 rYIt4jKIiqhSpt1tVlJPcgFDd98rwtSjOApgTG5jCPzaE6spD5r208egV+JlwKfRGViXrbPBpEw
 L0OAztX4QPRA7jzE=
X-Received: by 2002:a17:907:2da5:: with SMTP id
 gt37mr22331316ejc.316.1638520917750; 
 Fri, 03 Dec 2021 00:41:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb/7LfnJkZdygdHrdv8Opu/P8GNBZ71fU2X1d4rvGa3jMNrBM7Vo1vtI9fJLdAjbdMVuP/5Q==
X-Received: by 2002:a17:907:2da5:: with SMTP id
 gt37mr22331277ejc.316.1638520917422; 
 Fri, 03 Dec 2021 00:41:57 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j17sm1535384edj.0.2021.12.03.00.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 00:41:57 -0800 (PST)
Message-ID: <63d013c1-bacf-2c06-896a-fd9c2b010653@redhat.com>
Date: Fri, 3 Dec 2021 09:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v1 00/12] Add riscv kvm accel support
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, kvm@vger.kernel.org, libvir-list@redhat.com,
 anup.patel@wdc.com, wanbo13@huawei.com, Alistair.Francis@wdc.com,
 kvm-riscv@lists.infradead.org, wanghaibin.wang@huawei.com,
 palmer@dabbelt.com, fanliang@huawei.com, wu.wubin@huawei.com
References: <20211120074644.729-1-jiangyifei@huawei.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20211120074644.729-1-jiangyifei@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Dec 2021 09:21:49 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Dec 2021 08:42:05 -0000

On 11/20/21 08:46, Yifei Jiang wrote:
> This series adds both riscv32 and riscv64 kvm support, and implements
> migration based on riscv.

What libvirt does when detecting KVM support is issuing query-kvm
monitor command and checking if both 'present' and 'enabled' bools are
true. If this is what these patches end up with we should get KVM
acceleration in Libvirt for free.

Michal


