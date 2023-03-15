Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVG1-0002TJ-8W
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFk-0001oM-Ar
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:32 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFb-00029G-It
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id l1so18050701wry.12
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QmiQu8mdrNxNFQhkZw0dMyYO7f3kURdPYmnUakKXAyA=;
 b=QxREuuwpdR15RN5JNit0xAyeDMNaCwDEIqGbqscfA9c3UMUJLDCUDtiTakVi9cvFU9
 aGtaNmcnergtPFuoykuf19BTHGmBIUSK5omOrtfcnvm5whLWBC4Qing/g/RCg3Mz+gKO
 RQSnbsQ4EeNwNEC1mXukX45B6c5mlFfa7EQW1EbSuocQGtM+qZAluf5+IDh/eLNaWuhM
 vEsqkbXHFXS9qILKMuFLJMsGGTOfVaw9oaj0g1mptuvY3sOY4YIXD48p4/BlYNznmaPw
 pV3iIYWcOmw1PZGvQ/2e98XgVpV4FZ+iI7Jlbpm1fHyDRLocOa/4OmTEfu+K1DqoQhwL
 70Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmiQu8mdrNxNFQhkZw0dMyYO7f3kURdPYmnUakKXAyA=;
 b=W8LpuxMDK2/IGIm23bJc0q6DNl4wv7QIWyaWJlirJGejo8TJD25Jm6Sayrre+kHuur
 ZPYfULeseM+NRqCHZIg76d3Rz1NbZVx+7lyyoSv1yqwOqWB8RJnFJJfxOBZ+rKk68Wi+
 UTkHlPmFO00pk7rfm5G2dbd1N3FqsAHoCooh8T75qpdXK/BH7HDxgCQOgDARPQvKaTMd
 oy9qaMAfpyS062pfLtBjQx0794j+5M9Vrl2ixMKflzFDtK3lOaABCn9w95rddpMnu+DU
 q7JgQogbCsI0fd+G1ZIbe59eZzNYTpac4xQGuHB3p4jt1Ip9Te7BOMYh11yVDhQFW1Qz
 AzPQ==
X-Gm-Message-State: AO0yUKUEvPhfWXdIKUjETCLTrSEHbujwmTtBhjb2Y+z0rFUXhBcI2R4C
 +PKIQf52/SbajWmWyH9Bd7g0cQ==
X-Google-Smtp-Source: AK7set/aaaOhbJJyrpgwfF1X2i5ZSdZds8sgsnXAZu9DZ+qxnnfWU8ZYPn+C9jOihCJOsJfviUNlYg==
X-Received: by 2002:adf:dbc7:0:b0:2c3:f79a:7319 with SMTP id
 e7-20020adfdbc7000000b002c3f79a7319mr3106758wrj.17.1678902561446; 
 Wed, 15 Mar 2023 10:49:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a5d6507000000b002cfe71153b4sm5185405wru.60.2023.03.15.10.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 199A31FFD4;
 Wed, 15 Mar 2023 17:43:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
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
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Niccol=C3=B2=20Izzo?= <nizzo@rev.ng>,
 Paolo Montesel <babush@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v2 30/32] contrib/gitdm: add revng to domain map
Date: Wed, 15 Mar 2023 17:43:29 +0000
Message-Id: <20230315174331.2959-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:49:33 -0000

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anton Johansson <anjo@rev.ng>
Cc: Niccolò Izzo <nizzo@rev.ng>
Cc: Paolo Montesel <babush@rev.ng>
Reviewed-by: Alessandro Di Federico <ale@rev.ng>
Message-Id: <20230310180332.2274827-9-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0b6c77eee0..fa9cb5430f 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -36,6 +36,7 @@ oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
 redhat.com      Red Hat
+rev.ng          revng
 rt-rk.com       RT-RK
 samsung.com     Samsung
 siemens.com     Siemens
-- 
2.39.2


