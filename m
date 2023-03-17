Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd8vj-00055Q-D5
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 08:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8vg-00054c-KY
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 08:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8ve-0006hL-Ph
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 08:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679055085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdyWJZv8vhAFDbVlVpAgxslKT4rLXftuJGVINjtZsvM=;
 b=aJDcFbUROquPXUKo9w8C56fBPn8iu5IzU+OUyjszX+NGEkTDr5tXIA8icom4bTK/ezK5BM
 Ho5UcR9qX+ghLZgIEAjky0A2f44CYCw+ltOb+YUUYhrNdvdfKjXq+u8HGlXUtlWsTVThEt
 R9kU+VLDSVAsRVNW+6c9qCxXT6OyQz8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-5nx5CML8P222ixwSBqOJhQ-1; Fri, 17 Mar 2023 08:11:24 -0400
X-MC-Unique: 5nx5CML8P222ixwSBqOJhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k41-20020a05600c1ca900b003ed383b1b62so1779809wms.8
 for <qemu-riscv@nongnu.org>; Fri, 17 Mar 2023 05:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679055083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VdyWJZv8vhAFDbVlVpAgxslKT4rLXftuJGVINjtZsvM=;
 b=o+lqZBLy3TJpc9BC/AcpBowSQTUovvORMPfjlbN4TVeO4y7RVTgVOsVxafLUSQapos
 TnIEyGVupHtKTf6uOLX3KeJwkHMCeC7CcNbBuXa38EIEEdKWVZHmzDwPUMxztcEAkhml
 lQ0R53xvl3/L1pSD9sJjEXv3BAfgFj6qrQyHL1lav4MNvVMeEF5cMT03d/reW6rLmr3y
 fgNJYgjJ9+B4ZQMirtNtXCIhondArPvxKUV0Qk+GmlRwGmAowTj9wNZ/gzE+zHnrXSkp
 P3fxMgeWQYzVCbWJXFlXskgBwZ3ZzSEhwuq0HRhfEgdrx9pYyYNKp7stuG6odp8sZsle
 ipKQ==
X-Gm-Message-State: AO0yUKWJhT131pZbchrk1zoBvoKnBz6MdanUigYPv0B1RQkqebpO120G
 sRUCZx4imoQhkG23wW6kzo/ICZ8y/459a9zULMumiU/ifB5TT5QgCja32f9ZZU52PGf5lwsQZp2
 BMSCj+4m/w1gqeuY=
X-Received: by 2002:a05:6000:110a:b0:2ce:a93d:41a7 with SMTP id
 z10-20020a056000110a00b002cea93d41a7mr6815326wrw.40.1679055083547; 
 Fri, 17 Mar 2023 05:11:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Drn8o6/nNTBEgK8SgVpgvMd4RO9wUeVwEOco0AOkK3H0Ve2COt2l+fdAqjqS7xNs1SwZQWg==
X-Received: by 2002:a05:6000:110a:b0:2ce:a93d:41a7 with SMTP id
 z10-20020a056000110a00b002cea93d41a7mr6815266wrw.40.1679055083247; 
 Fri, 17 Mar 2023 05:11:23 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 u4-20020a5d4344000000b002c5526234d2sm1861459wrr.8.2023.03.17.05.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:11:22 -0700 (PDT)
Message-ID: <5f003318-c22d-b13b-3976-94b0f874c720@redhat.com>
Date: Fri, 17 Mar 2023 13:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 06/32] include/qemu: add documentation for memory
 callbacks
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
 Vijai Kumar K <vijai@behindbytes.com>,
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
 <20230315174331.2959-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-7-alex.bennee@linaro.org>
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
X-List-Received-Date: Fri, 17 Mar 2023 12:11:29 -0000

On 15/03/2023 18.43, Alex Bennée wrote:
> Some API documentation was missed, rectify that.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1497
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/qemu-plugin.h | 47 ++++++++++++++++++++++++++++++++++----
>   1 file changed, 43 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


