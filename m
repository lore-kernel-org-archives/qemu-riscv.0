Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd8qA-0000uj-30
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 08:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8q8-0000uD-L5
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 08:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8q6-0004jk-U5
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 08:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlVkuVds0BzmioA6HMJHcmCMJQMnqByBFchTL1H/jl8=;
 b=WQ0TN3SKLch10pJYiH6DQ7zQ/0EJJUrv7UG0E50RsdiF/+wiE0sSCKR6URvRikjzX7hDJd
 fV2heA+01NMy/K+Jc6raBzMYvBZdgra4L7o2PxBzulK2NmLbI30c9MYqlvVpT/TWOpkSYd
 7JabrbRmnvxA6gM3ZmpFw3Z549YWNaQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-_nZrj_4pMs2LBzXMSHw8rg-1; Fri, 17 Mar 2023 08:05:40 -0400
X-MC-Unique: _nZrj_4pMs2LBzXMSHw8rg-1
Received: by mail-wr1-f70.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so767387wrz.18
 for <qemu-riscv@nongnu.org>; Fri, 17 Mar 2023 05:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xlVkuVds0BzmioA6HMJHcmCMJQMnqByBFchTL1H/jl8=;
 b=Iit0+R+AB0E9M9wzaVAV/1qDYiWGvNslsgta4d5WkiPn9h04eMY+2NFqHHhLuNt5L9
 /EXkmTmG6SfO5F+KcyPx0Nw7CQcp41iHY9zOONCSsJde5WV3lbsDSQdFITynjryd/u2Y
 TjtUYfk+zKcgPzS11haO0XXwpn1/KK1J+4v/chHrSc6Sv2av3+rgjYd5Mn6aFCn73CH2
 QnZFq7GI7Blsrrn7neVPcRKOGf6E8UPCzVbhE3rRCP6zxP8ZHv3kbJxphMokDgFrCxsh
 ykUt9GBhAdOju6BzQPa0WHUhuad+M5O4AnniQiBbGxwrCSA7WvsxH5YBHevO46Mhqolm
 2tMw==
X-Gm-Message-State: AO0yUKUsRvBs+E26luDj8DvrdMDVmDHcPa5WlGqH0fTJpHJJ/exvhr7P
 vufoYDjatWqkLaFxl3JTVWWMjwz9ogUI8mGJlI9alD7/aQEoS5HorjD0Cjbzr2Knf0MbRp3uBkI
 20qLFMVShnXBHuso=
X-Received: by 2002:a05:600c:4746:b0:3ed:26fa:6ed0 with SMTP id
 w6-20020a05600c474600b003ed26fa6ed0mr2204852wmo.0.1679054739751; 
 Fri, 17 Mar 2023 05:05:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set/rGd+QwS67ICAtgwac0dQrNdBoIvaXc11jgB0c1NyzXp4Ls03CcAuumKTL4rvmqnyB01+XFA==
X-Received: by 2002:a05:600c:4746:b0:3ed:26fa:6ed0 with SMTP id
 w6-20020a05600c474600b003ed26fa6ed0mr2204757wmo.0.1679054739358; 
 Fri, 17 Mar 2023 05:05:39 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c220b00b003ed3034698esm2135722wml.9.2023.03.17.05.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:05:38 -0700 (PDT)
Message-ID: <ec17a227-8c71-d238-6ead-89cfec687727@redhat.com>
Date: Fri, 17 Mar 2023 13:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/32] tests/docker: all add DOCKER_BUILDKIT to RUNC
 environment
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
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-3-alex.bennee@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Mar 2023 12:05:44 -0000

On 15/03/2023 18.43, Alex Bennée wrote:
> It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
> itself to get the full benefit of caching.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/docker/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 54ed77f671..9401525325 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
>   # General rule for building docker images.
>   docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>   	  $(call quiet-command,			\
> -		$(RUNC) build				\
> +		DOCKER_BUILDKIT=1 $(RUNC) build		\
>   		$(if $V,,--quiet)			\
>   		$(if $(NOCACHE),--no-cache,		\
>   			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \

Reviewed-by: Thomas Huth <thuth@redhat.com>


