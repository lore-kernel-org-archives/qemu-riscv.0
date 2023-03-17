Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd4Tp-0008Rn-FD
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 03:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4Tn-0008Qi-OS
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 03:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4Tl-0006h4-KH
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 03:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679037980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqrnyekWZtj3autRtqGDoL7x0MtC0GOcxCuc87fpusU=;
 b=cwqTXZ6Rf74awlOSXm30HQtAMEbGYIqy6g9ONZEL/6Obr36tmsNChL72QgAajhJ/6V/l8B
 ZIywMCqnc65ZvcGuIarBCBRY4sa8WFo+x0+My3mYbrEGFCDSUDto4BXtesvQCpIvMrJx9x
 ujnqI2r5XxU1Fu1ZEKJRL48xKjnEv+g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-p6s1Z8UiOFCHKYPyqIEG8g-1; Fri, 17 Mar 2023 03:26:17 -0400
X-MC-Unique: p6s1Z8UiOFCHKYPyqIEG8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so1876234wmb.8
 for <qemu-riscv@nongnu.org>; Fri, 17 Mar 2023 00:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679037976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqrnyekWZtj3autRtqGDoL7x0MtC0GOcxCuc87fpusU=;
 b=tRv3FXgbivYgjKbRnzsGvoy1qqE4FmnLsKry1VxGkfTXY2iq03yYymUyFbE+BMmCTW
 Q7nMKmxoovDeDNl3HcltrzrPXpeawrKrUsPucW/jn0k6Ya2ggqRs8VRhH33Wc/jyQiyp
 2GLBYpm5ZSScvzxkgnHMoj+5RE1ek1USPAhdp3PPJI3NB46EdFm9MpFACcydy1MyfjOZ
 S8FUFB7X7EPGAMWvaUPU0GIaoxHoS7ikFKGX7UPC8tgzag3J158sP5A8EdOxU3ojH9Jk
 qkEUNoXE8cBVyPZGMdgIWF9UWwAavdwfUKXPoOQ5Lg5/Pm5HsicjGFAEHSKDX3fNSXn6
 Jtiw==
X-Gm-Message-State: AO0yUKV3CSeZ4ZxgianCoYU5oqfvTds705kGn/u0qsRqJfapDJn7/t/f
 x5v40h/DlFvBbsB4NRV09kpkUri/6kMnY8/9C17ZXdwtlQ1kTTHFbqSKEQuvhK7ybSa11bQ+Ivp
 vjCkzB9fc9iWKV+Q=
X-Received: by 2002:a05:600c:4fce:b0:3ed:24f6:1089 with SMTP id
 o14-20020a05600c4fce00b003ed24f61089mr16092907wmq.15.1679037976115; 
 Fri, 17 Mar 2023 00:26:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Gl8eTfcazshyynddIacq5+dgKonMcbVTvMaTdoQMnA6FrXfJgH39r0LtsNqEKcjgiAOfLyA==
X-Received: by 2002:a05:600c:4fce:b0:3ed:24f6:1089 with SMTP id
 o14-20020a05600c4fce00b003ed24f61089mr16092826wmq.15.1679037975745; 
 Fri, 17 Mar 2023 00:26:15 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003dc42d48defsm1479979wml.6.2023.03.17.00.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 00:26:14 -0700 (PDT)
Message-ID: <e3e19ba8-6574-c989-ad02-25fabe5956f9@redhat.com>
Date: Fri, 17 Mar 2023 08:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 31/32] contrib/gitdm: add more individual contributors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Amarjargal Gundjalam <amarjargal16@gmail.com>, Bin Meng <bmeng@tinylab.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-32-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-32-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 17 Mar 2023 07:26:24 -0000

On 15/03/2023 18.43, Alex Bennée wrote:
> I've only added the names explicitly acked.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Bernhard Beschow <shentey@gmail.com>
> Cc: Amarjargal Gundjalam <amarjargal16@gmail.com>
> Cc: Bin Meng <bmeng@tinylab.org>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> Acked-by: Bernhard Beschow <shentey@gmail.com>
> Message-Id: <20230310180332.2274827-10-alex.bennee@linaro.org>
> ---
>   contrib/gitdm/group-map-individuals | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
> index e2263a5ee3..3264c7383d 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -38,3 +38,4 @@ paul@nowt.org
>   git@xen0n.name
>   simon@simonsafar.com
>   research_trasio@irq.a4lg.com
> +shentey@gmail.com

FWIW:
Reviewed-by: Thomas Huth <thuth@redhat.com>


