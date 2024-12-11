Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23196E7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 08:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLHiW-0005NP-Lw; Wed, 11 Dec 2024 03:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tLHiT-0005KG-Mb
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 03:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tLHiR-00026l-Kk
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 03:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733904302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4s+NpWa+3/3BwA8AAQyDd1povigLaAY4ojJNmt2acTM=;
 b=gfxWWXTtwTGw/jjyo6MyBtnVGVzvR4oMYrkZoz2gxyAvmwtVo+Ymb/joAaL00+pYkqJavJ
 MT9DeXijeWFIArsuOwT1O2VuAZtmkJ1WBCa90OhCpRGxL5iChBBB9DAJ7wD6L7ZHOq76ZV
 MVkIO8pGbA5qBKsX8/KnaGFCxc2AQmk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-CJhnRcd9MLizWDCh-M_YKg-1; Wed, 11 Dec 2024 03:05:00 -0500
X-MC-Unique: CJhnRcd9MLizWDCh-M_YKg-1
X-Mimecast-MFC-AGG-ID: CJhnRcd9MLizWDCh-M_YKg
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-aa68952272bso26749766b.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Dec 2024 00:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733904299; x=1734509099;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4s+NpWa+3/3BwA8AAQyDd1povigLaAY4ojJNmt2acTM=;
 b=C17dP3k7I43xXY9zU/DeFM8tAUJu3OL06NF90wT1j36br9DWKVD3/wHfnIsIjXOSR0
 hTqk9etq9JLskswFRiesYBIro1PJbHUI32ke5H1nqgRAZmFLZGtubpwHYNAYAmAz3xCv
 q3BmUhmJo1qGIQGYuLmBB9NaE+zLNa73rOBN6MpASqKq52HRSnKFllr5+1QzHVppMD43
 pDSOjbgwp5chZuvkJ26IgRye8jRRHRhvqqqcEa4hpBr8yb7l9BH2G0P87VVN5X7fdMt3
 4YZbO9YW+s1Jj0RwrV9gdR45724vqb6lEt6meUZyZaPQvoJTNOw48SAnrK9DQu8DtzQu
 hRBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYlP45eqgjbM/MzwuesSbA4Z1zir/P/RA27fG4KecVRhlHHdcjNjIjVl+rtYAMIO9D/phlj/iBG0mw@nongnu.org
X-Gm-Message-State: AOJu0Yw+6wTg9V/+UXkHnJpPW6MY39bFXo1xJgZtfCRdt2ogx0YiCjJR
 zPif1k5Pkl1gmL8/U1BMjgPus+/+4R1oSqtRFjglWfqbBXoJdXjqVSK1eMdDzVgRyObFRO2OVX4
 LfqS9hT02n1KQ26HoBL9otN0Y1x0EuJ6SjdpQAWa3RTMk2ktEjIub
X-Gm-Gg: ASbGncsTNUeNqpOVGkael9mv2Z2qxUr7wXNtYREeuHOoSFHADlzz9RJV9bSx8570ys8
 ROL4npGAih+k/MXFANjGotru6YkHuPD2pHEg8sAGE97WerVlIV+2zYVafvDxg5vjvIIB3aXIv44
 D5CXTOIHamVJwI1XoxtKVHUyLkz1ArPpJipPdZM2IMEd7f2s0sw7l4CXgNdLATCx3O5MVRxsP/V
 FThHy1EETDCr1YOZpEIAQvN8O7JflDCQJlApUq9MdmBN6g4y8Tp8XvRyKyscm7Jq/PWxnzi8A/0
 qHQOycM=
X-Received: by 2002:a17:906:3cb1:b0:aa6:a501:9b3b with SMTP id
 a640c23a62f3a-aa6b11a33f8mr165493766b.19.1733904299535; 
 Wed, 11 Dec 2024 00:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHx9zPyu3ZYxz+Ve0LFUNe9sWJjL4dCVSXikoawUMCtndqiV6/TKY18W3NSlLQX/3f5rahDQQ==
X-Received: by 2002:a17:906:3cb1:b0:aa6:a501:9b3b with SMTP id
 a640c23a62f3a-aa6b11a33f8mr165489166b.19.1733904299103; 
 Wed, 11 Dec 2024 00:04:59 -0800 (PST)
Received: from [192.168.0.6] (ip-109-42-51-17.web.vodafone.de. [109.42.51.17])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6975b1f27sm330082466b.113.2024.12.11.00.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:04:58 -0800 (PST)
Message-ID: <ba91b0da-ea60-4802-b336-f3a650d06ae4@redhat.com>
Date: Wed, 11 Dec 2024 09:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] tests/functional/aarch64: add tests for FEAT_RME
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-16-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241210204349.723590-16-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y8WH424DcXFmXKwj5m9CIY6Pe5HG9OuVSPBJxq1u7ps_1733904300
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/12/2024 21.43, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> This boot an OP-TEE environment, and launch a nested guest VM inside it
> using the Realms feature. We do it for virt and sbsa-ref platforms.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> -----
> 
> v2:
> - move test to its own file
> - add sbsa test
> - check output of `cca-workload-attestation report`
> 
> v3:
> - build and run test with cca-v4 images
> - factorize nested guest test between both tests
> - remove accel tcg option as it is the default when running tests
> Note: It's a long test and there is a work in progress to understand why
> debug build is so slow (x12 vs optimized).
> 
> v4:
> - use pauth-impdef=on to speed up build time execution (x2.5 faster)
> - increase timeout value
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-Id: <20241203213629.2482806-1-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/meson.build                 |   4 +
>   tests/functional/test_aarch64_rme_sbsaref.py |  70 +++++++++++++
>   tests/functional/test_aarch64_rme_virt.py    | 100 +++++++++++++++++++
>   3 files changed, 174 insertions(+)
>   create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
>   create mode 100755 tests/functional/test_aarch64_rme_virt.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 0a76bd9954..4e207c53d5 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -13,6 +13,8 @@ endif
>   test_timeouts = {
>     'aarch64_aspeed' : 600,
>     'aarch64_raspi4' : 480,
> +  'aarch64_rme_virt' : 1200,
> +  'aarch64_rme_sbsaref' : 1200,

I was a little bit worried when I saw the big timeout values here, but 
that's only for debug builds, right? I gave it a try in a standard build, 
the tests both finished within 5 minutes, so the standard runtime still 
seems to be ok.

Tested-by: Thomas Huth <thuth@redhat.com>

 > +    # This tests the FEAT_RME cpu implementation, by booting a VM 
supporting it,
 > +    # and launching a nested VM using it.
 > +    def test_aarch64_rme_sbsaref(self):
 > +        stack_path_tar_gz = self.ASSET_RME_STACK_SBSA.fetch()
 > +        archive_extract(stack_path_tar_gz, self.workdir)
 > +
 > +        self.set_machine('sbsa-ref')
 > +        self.vm.set_console()
 > +        self.require_accelerator('tcg')

Please move the set_machine and require_accelerator to the beginning of the 
function since they can skip the test in case the prerequisite is not 
available. Otherwise you've extracted the asset in vain.

  Thomas


