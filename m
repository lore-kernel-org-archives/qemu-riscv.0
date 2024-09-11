Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CB7EE020F
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 06:15:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soGbr-0000iL-Uz; Wed, 11 Sep 2024 02:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soGbo-0000Ed-2f
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 02:13:45 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1soGbj-0008Uq-TL
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 02:13:42 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso450874266b.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 23:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726035217; x=1726640017; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=poAudXl/SIIw/XPRvz0lT3oV27sGXK44B6oZsCmnODk=;
 b=wIBN4eQt8wE7lZaAdDB8P7pT9ptO5Np9KY7vVSc9XAKNJyjG/DsESiTyf0dksf3IcK
 0NpAeJaE2AxDCnBdGeJ3NU8uaFtl2cSqDIJ3YosH9zmYNqS8aiQpF+7mxHSPrYNpyAdc
 MuzwXRESXxrIZocZuv4pU1gFEFrKQpRliX7V8rXxzx/ktVQ0x1CTmTPDsn0w+tugFjGs
 ghOCC2yhoLeRJXG3QNnFY+1uxkFhinONzT6p7IqtgqVAPjWf7ehRJZMTCRDXhBFLw6V6
 cTPn7XMQ+qfrHNGG5Yo4RBK18b+y+m2dr1+62DFwdlDomxfoCqjH+p2SaQZgXrqaD/0d
 AkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726035217; x=1726640017;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=poAudXl/SIIw/XPRvz0lT3oV27sGXK44B6oZsCmnODk=;
 b=XRUG+Ag/J507enCCv4OocsWH8E8fltuAKLjC32Cf/Q1NcaH2H9WnqIqWlMVtUBedc+
 7x2rsc73B8WMC5l/95gc2aBznbuk3WGXqjlwGT7tsROPjYmFuLYO03ytc9tstqYUVij2
 UUfqfPPRNhy47Fh/lUYD/KA9mvXSEQiGYC/yCXGr5UBKM5uxDr4kaBrcimyudBtGVT7R
 XoQSIkEbBiobK8Szho8dfkAyZivgdqIgSbdfUx0GSLAId96mqGwts49d2I4cy0uabidx
 tTutYsnbv38NQ6SOKUQ1W3qLCcuvP/G6mdzOyoxTA8hHDIzvt8v5bziclNVlDZQ8mzxW
 UB8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT5tl5pKhy1/YObXk4CvAaht5W029lvwfKedEP44mKToQG3y35Fz2Bz/mitRidUrTDkNtgSxbiDbt+@nongnu.org
X-Gm-Message-State: AOJu0YzHRn6a59J9nTfqKHou1RFoYsc7fHATT+cLnOxW+dzgQDkXingk
 85rD7P2oD3dl33SsIphoyKBbvRj5V+YLwzDt4/jVwZuYUQt8RZIKOzk/yPJ/pKQ=
X-Google-Smtp-Source: AGHT+IGxSIV12l24qw5tuVF8BHzeUm7qf/id1NqLdpbzEe6nCFQXxSFQeScbp7YFg/szcxgjwvBm3A==
X-Received: by 2002:a17:907:60cb:b0:a86:799d:f8d1 with SMTP id
 a640c23a62f3a-a8ffad97d26mr288054766b.47.1726035217121; 
 Tue, 10 Sep 2024 23:13:37 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.196.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ced1e0sm570162366b.164.2024.09.10.23.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 23:13:36 -0700 (PDT)
Message-ID: <2993dcdf-b8b8-48f3-b322-a121989559a7@linaro.org>
Date: Wed, 11 Sep 2024 08:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/39] ui: remove break after g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-37-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910221606.1817478-37-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 11/9/24 00:16, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   ui/qemu-pixman.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


