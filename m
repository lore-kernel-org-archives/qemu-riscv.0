Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd4SB-0007P6-Ih
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 03:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4S9-0007O9-JR
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 03:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4S7-0006FP-7g
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 03:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679037877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xW5YRWUqoI7YaHI7gPZKm4zvNmnVkp4WxZPUXFEvJBo=;
 b=OnDUM4ca2p/TJYhsHtnYSvFbnWlXbO5i6hGFsmuk7AQBj/mfd3vZZQ33Gjfb+Tb76tW3la
 pup2VhwgRTcOuDOgB4HkRgKL04ZyMWznPmJvAOi0KYdQxhgTuDlbBbF6fr/jyuPK8MSGMn
 Z2GkYYpcIsGO1T50laN6BD5OnPIPWvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-2WNsMfZFO0uUDZWBWFgptg-1; Fri, 17 Mar 2023 03:24:35 -0400
X-MC-Unique: 2WNsMfZFO0uUDZWBWFgptg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bd27-20020a05600c1f1b00b003ed5cf99f0cso1742881wmb.1
 for <qemu-riscv@nongnu.org>; Fri, 17 Mar 2023 00:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679037874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xW5YRWUqoI7YaHI7gPZKm4zvNmnVkp4WxZPUXFEvJBo=;
 b=jv87qQl0e51uLY6fUYY4Gq7lLF2huEeUGGiz8iPpuoFe9h+tlPlXodSK57m3sN8dwb
 iyVMux6OltIEDqBT7FAk5rFNHFKOvmfH02rObjfBa+R7n7AxyvVkBqm+wqzh6McX3fpE
 7jdWbw7ZYjSZLWJ9ctyIOlrw3yA73Bxs1+53F2/yd++tyfOa0jw3p8T8zcj2ua3oKgMi
 wQhgaFmJGpQHG3bSK+5ya9LKOZeacKWmOz/q4jP3wfKetwV4cAFW315YriGZmkamkLNO
 ceuUfxt9tgnkbQkPhrX5/TblTiURxlzBbXLo9ULv8rvYChZu3Dosv4g3A1fSJ/NtclQb
 Cwtw==
X-Gm-Message-State: AO0yUKXf91Oc6HdqsxcZjbMe+aVT4T4u3ch2HTHtxLIvOA7H885F9iBc
 fDJSHY2pslnUMY36eUdy4xyh9kubIbtCfTuqRbl7N0HDEUb1Zch2iwV5qgf3lBoI+ZJ4icaoqkn
 MEEi81+RDMFwoiOE=
X-Received: by 2002:a5d:4d06:0:b0:2c7:daa:1c56 with SMTP id
 z6-20020a5d4d06000000b002c70daa1c56mr5851978wrt.4.1679037874688; 
 Fri, 17 Mar 2023 00:24:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+aVAxUwOvFA/ilN/jNay4xxCe5XpeNTShUolDwE3ogiowCBRVEg+sW7qmY2hMDnR5uIw2AZQ==
X-Received: by 2002:a5d:4d06:0:b0:2c7:daa:1c56 with SMTP id
 z6-20020a5d4d06000000b002c70daa1c56mr5851904wrt.4.1679037874240; 
 Fri, 17 Mar 2023 00:24:34 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 y1-20020a5d4ac1000000b002ceaeb24c0asm1262440wrs.58.2023.03.17.00.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 00:24:32 -0700 (PDT)
Message-ID: <95ef3696-f934-376e-ee88-687477a32242@redhat.com>
Date: Fri, 17 Mar 2023 08:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 05/32] gitlab: update centos-8-stream job
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
 Peter Xu <peterx@redhat.com>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
X-List-Received-Date: Fri, 17 Mar 2023 07:24:42 -0000

On 15/03/2023 18.43, Alex Bennée wrote:
> A couple of clean-ups here:
> 
>    - inherit from the custom runners job for artefacts

I know, it's a difference between BE and AE, but in case you want to be 
consistent with the yml: s/artefacts/artifacts/

>    - call check-avocado directly
>    - add some comments to the top about setup
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../custom-runners/centos-stream-8-x86_64.yml  | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


