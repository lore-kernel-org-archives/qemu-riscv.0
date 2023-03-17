Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd8sz-0003To-9a
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 08:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8sx-0003Qn-Uu
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 08:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8sv-0005CD-4E
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 08:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kScjxjWF3/DNY8MH6JIoXktFOWCux+jIyciHRIIYQeY=;
 b=IRZnhxZ4agnw63io9mqVbJoAkLtSlQQcuY5xjKUZZ6i2/zD3RIDrjHifbylHCMpDpmQcax
 /tkB5SewZRTnbpsQvwEw/0N/Beq/Qar6CLeeVeoH8JJc+jJks0z0jxqidbFYZxJiSp2WNL
 TbnlRvIpm1C4w2Dfx1AXKdyw4l/9/Z4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-mJk3lttBOY280iRKdideqg-1; Fri, 17 Mar 2023 08:08:35 -0400
X-MC-Unique: mJk3lttBOY280iRKdideqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so1783075wmj.4
 for <qemu-riscv@nongnu.org>; Fri, 17 Mar 2023 05:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kScjxjWF3/DNY8MH6JIoXktFOWCux+jIyciHRIIYQeY=;
 b=tyPSpG1IJmmRXAq1eu91Q7mZ67lDop1huODgknLRtS0mSmRhActLDZw3NPSh/IfsMz
 3JXee6wi4XAHdzaYhUJsPB9ZG7ht3yZE5YOI0lw4c1wpOrb+GoL++Ym0JjgyHtLJHw2Z
 lE2DHLpCICFNVAqP/04ZaQyLTeSP3ho1+o5CLF59G1jNbROSjIQDB26eB2I2PJAvw97d
 hkR72HVQ117MKE0o4ZIHqn4M6ACwYzHk57lBAnm60P7U0y/YO/aSynmDRjwj+WETKdYS
 CMnVCcV6QaDGdVFFgX30zzH3ptuY9fUJqY+ToR+bOFAT+2nE7F3+x2cQvhKAMiktmB1O
 E9HQ==
X-Gm-Message-State: AO0yUKWRDeAuWSXvjcID7Og4jv7CjsvLCaDuytreLFQ3gkc/4PMioy6C
 No51jrS3B2xh+PIFXH8synnwz/xpNRm1Q8OskIkGyZ0WwgVvDijG5osjN8TwzDrGWtK9Kd4B4y1
 sPUF613M9AnSLccw=
X-Received: by 2002:adf:f150:0:b0:2c9:70a4:4f94 with SMTP id
 y16-20020adff150000000b002c970a44f94mr7656732wro.18.1679054914265; 
 Fri, 17 Mar 2023 05:08:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set8BjzNtWSjj0hviwgMCvvExxTLEB7Z7kxpInt7PqehO0hi0hW9EyLdwSex7xipSCivTOE1MHA==
X-Received: by 2002:adf:f150:0:b0:2c9:70a4:4f94 with SMTP id
 y16-20020adff150000000b002c970a44f94mr7656656wro.18.1679054913951; 
 Fri, 17 Mar 2023 05:08:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 j20-20020a5d6e54000000b002cea8664304sm1791406wrz.91.2023.03.17.05.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:08:33 -0700 (PDT)
Message-ID: <162c7939-abed-bdb5-47bb-e7b9e873f6b6@redhat.com>
Date: Fri, 17 Mar 2023 13:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/32] tests/tcg: add some help output for running
 individual tests
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
 <20230315174331.2959-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-8-alex.bennee@linaro.org>
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
X-List-Received-Date: Fri, 17 Mar 2023 12:08:40 -0000

On 15/03/2023 18.43, Alex Bennée wrote:
> So you can do:
> 
>    cd tests/tcg/aarch64-linux-user
>    make -f ../Makefile.target help
> 
> To see the list of tests. You can then run each one individually.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index a3b0aaf8af..8318caf924 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -201,3 +201,10 @@ clean:
>   
>   distclean:
>   	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
> +
> +.PHONY: help
> +help:
> +	@echo "TCG tests help $(TARGET_NAME)"
> +	@echo "Built with $(CC)"
> +	@echo "Available tests:"
> +	@$(foreach t,$(RUN_TESTS),echo "  $t";)

Reviewed-by: Thomas Huth <thuth@redhat.com>


