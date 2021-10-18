Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcUvL-0007JA-CP
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 11:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcUvK-0007Ha-2u
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 11:51:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcUvI-0005I6-0r
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 11:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634572294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3lGxh86SIo5Sxoni9msUYyZM2QdjHhWJuKMLXf2ILA=;
 b=ifvlm39VKsYjM2RQhdmXzbpeQMb9Rb0mdeVMjXvWkNjI0GwYJcU8Hd2Nht9ES1I37QL+6A
 pDx6rygbtyOgJyKHVqEGWCBRoDEAlt0GNUPW77UZTlQEX36CxWkCuvRc/rmsblRx4zv1xZ
 0ZJ4CPAdD2Y5MnypL3raJGwArcWAK+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-awseAR69PbWZqy27wcV_PQ-1; Mon, 18 Oct 2021 11:51:33 -0400
X-MC-Unique: awseAR69PbWZqy27wcV_PQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so152461wmg.2
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 08:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n3lGxh86SIo5Sxoni9msUYyZM2QdjHhWJuKMLXf2ILA=;
 b=xuwRRhnGchWcubmaB+qrDOLO5pfCsjx5F7XoFA0lq3ZqiVU+Lcem+QsparVjC52TUF
 AxJvCLLJ9CKJkprbtH/8iOv8skdAogA5+afWdd9UBcrKGx1GbFID9qkmDAuY4sn1ywiO
 LwmL7s1tFhwGt/u9AUsBk9yZ7J6e4BfrNdwoF41Fgjt1IJNIkiQB7nqUSmdKbsICh35q
 RwF0diNeHCyhFUQuRuqIdCSCeK9nQyDFwFqK06dJRd+mBqP/HEpNmKZAflFPTyK5+VrA
 7sphOIe5JGawbY1mUHjiCTty45SbxnWKLBuHzFt2F7Dh/9bMCgGLRcJLETCyUMdJu/71
 /tnw==
X-Gm-Message-State: AOAM531jkejACBi/IuYTqKya2Ta9eOkDZubtrLF78cJ8Q/xkrASWKC29
 4Z3K2WAFH2h13yMye6Q5hP58KQaK4Frz1G6A4F8bXovBJZtHMEiyt5LlHg8NlbxjuLiswIHyWho
 QIOlqfMzpk8GNbQQ=
X-Received: by 2002:adf:f10c:: with SMTP id r12mr25158355wro.298.1634572292274; 
 Mon, 18 Oct 2021 08:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCwqdMneGEZvE9BZB8XIQOqua0Zf5TsWN7Z/OgY6ay8qip2wgvL2Wtq7+QlTjqXEqTuBb5eQ==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr25158335wro.298.1634572292107; 
 Mon, 18 Oct 2021 08:51:32 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id v18sm14176501wrm.63.2021.10.18.08.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 08:51:31 -0700 (PDT)
Message-ID: <b51c604b-8f5c-c5e3-7deb-6d6830b30299@redhat.com>
Date: Mon, 18 Oct 2021 17:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211018153829.24382-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
X-List-Received-Date: Mon, 18 Oct 2021 15:51:38 -0000

Hi Bin, is there a cover letter?

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

On 10/18/21 17:38, Bin Meng wrote:
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/riscv/microchip_pfsoc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)


