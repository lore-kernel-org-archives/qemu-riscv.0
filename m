Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT6Gg-00012C-9L
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 13:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Gc-0000zm-V1
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 13:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Gb-0000oR-II
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 13:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632332563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVaOmuvSmYMdDMUDJJ0nLDELyFbMOLlDnDD2b93jvo8=;
 b=Ja7vFM+iXUQnBzuN4EBn8HCeXmnrr/fynOZL2cPuPbFyWx29Nd4BPPnrPl7K4rf1J8vNv6
 x6OjOG0se15Y/CuEeEKtDGMR147Wv6+G+PfhzcWMq7nb521lWxlWNuIplVmuEIm7eRumZn
 LR24a8q0iRQ1fIzOsJtnEzoYYwon8Sw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-YtkADhxaPZ-qt8dxR1q8CQ-1; Wed, 22 Sep 2021 13:42:42 -0400
X-MC-Unique: YtkADhxaPZ-qt8dxR1q8CQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 m18-20020adfe952000000b0015b0aa32fd6so2846046wrn.12
 for <qemu-riscv@nongnu.org>; Wed, 22 Sep 2021 10:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uVaOmuvSmYMdDMUDJJ0nLDELyFbMOLlDnDD2b93jvo8=;
 b=8BqUVw1sR6QLBZVySI/FxFaAi/nl9vjU+3SjyNyJQUQyKfSeIUSGlOaV73llIkCy//
 oq7gGYi9YYghTu1HSaX/KoGOT21FZFgOk0FD9LAfgHXzAgf3HmgB1rMM6zPwYQ3Zwvf0
 mYeDFKmZi0zfYY6gCJjmHNARlKwMoiNYc5bJ9i/5XD/Ymwfl/IguhqOHWd1Xoayf+w9n
 TiIEaGPZIPNYJgBWmz5zs2DyVuxdPFEiC5pspi0tVRyZnMGLvhT21ip4zHS1/RSZh0/Y
 d7oQxr5hO1Sir13w3qAgUSPklXxYxbBea9cO/7dsNh3gkxnYluPXOHnJblVi3F/quxdN
 uD4g==
X-Gm-Message-State: AOAM530L0LURETQOpTFKyLh/rTabIieWENV7pKuCQa8ZXJGHTKk0naBd
 9q+BkhOqZ8xgOnLUBFY4fLJs8r3KJsOe+DQ3UaaLttGfP8GTZ2C23xt6NLSgtfoeZCb7xySf71m
 1mbWD2kZhx990bdI=
X-Received: by 2002:a1c:7310:: with SMTP id d16mr326740wmb.30.1632332561640;
 Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMUMMi8eLqjRXCSalitvGzPda/oA8H6U5KYwVIDPTTCJLTISya0LAgbbYFrl2db1iXLKfbNQ==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr326712wmb.30.1632332561486;
 Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w1sm6588014wmc.19.2021.09.22.10.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
Message-ID: <bc37831d-4d31-8b02-acc9-c54191bbf31e@redhat.com>
Date: Wed, 22 Sep 2021 19:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-12-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Sep 2021 17:42:48 -0000

On 9/22/21 18:14, Damien Hedde wrote:
> It allows to try to add a subregion to a memory region with error
> handling. Like memory_region_add_subregion_overlap, it handles
> priority as well.
> Apart the error handling, the behavior is the same. It can be used
> to do the simple memory_region_add_subregion() (with no overlap) by
> setting the priority parameter to 0.
> 
> This commit is a preparation to further use this function in the
> context of qmp command which needs error handling support.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>   include/exec/memory.h | 22 ++++++++++++++++++++++
>   softmmu/memory.c      | 22 ++++++++++++++--------
>   2 files changed, 36 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


