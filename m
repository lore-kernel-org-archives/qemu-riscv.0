Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVGd-0005k6-9Q
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFx-0002SF-3U
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVFe-0002Bs-Fc
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:49:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id ay8so7868282wmb.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0N/4PabBLqV/G25pJQsAZWNm7Ckm3Whh6Khx55ga6lY=;
 b=RDj1iHq8LoIMKN4MX+P7q9gwxajV2pOtRK3j6P8PFfd9B6NNnMSb9erc0MlIK5wQz6
 5fSTJQxdrk7jBmE0MQkxF+OazHIrjNnjwgzTw4mak1SdsouTcuziDx6x0CyeZBYJIM68
 2TMtV2y9zjZLQNMtVG3RvOfYJ/LGt7VaqRlMNbzfKmNSSNHgijPlF2bPv87hcMKdilgZ
 dLG+nKf8efYN9UTxcIGNJscM+FdZu0MUxoitLrJETBAJKEtZs1H1Y8JeMJnpDCy7zlmU
 1CX+Sy6U6HQgWqtcsvhHNj1W4hhfTgrtOuiQ4PzxxeV+QPYl+s6DvpI8uTbdP1NGDxw+
 HWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0N/4PabBLqV/G25pJQsAZWNm7Ckm3Whh6Khx55ga6lY=;
 b=rj3xaFEejyxl5hp+4WBXa9o+0fxEJNl2pVMs1xd9yHFf3xkmjpEbO8ENRKIqNtKccN
 Qmf7lkspV/FkKzNM91hCXHw1I+4Fi7slZElNmHq4/bTjyDOLsK4ho/dv313OBNCiz8qU
 1n8Qd8tY4lunYNKGVVfoPWIbhDs6MKVUJrx/l7QkoKH52vMHZlJJu945LvY1fQC+RUP6
 LScC3ytExzcVm++SkhUGOcoLAcTNXwAo4nPpwmeAsYyQ79yxTpWyv0SdGlmIBihmePOl
 p/Q0UOaWBv06Xv3qvsrsugCt9lGjhArmyb0hwbGb6/zRMJoTff0s8HFN5xUe1bnqlNJ6
 gqKw==
X-Gm-Message-State: AO0yUKX/6GLzhUTTpCWuF46YeFF/YMcpfGCxV81ddHQ3DFilopEJGAjo
 LwCrelr6bj6qzw+V7mSrTvd/ew==
X-Google-Smtp-Source: AK7set/0RZJwAHZGDqwh5L+Jh0el5WLv2Y57y7FuRNcQLA19gfAyXP6PYgMI3jRUhG15cvJuK2x3Pg==
X-Received: by 2002:a05:600c:46d0:b0:3ed:2346:44bd with SMTP id
 q16-20020a05600c46d000b003ed234644bdmr5401196wmo.19.1678902564503; 
 Wed, 15 Mar 2023 10:49:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iz11-20020a05600c554b00b003ed201ddef2sm2641650wmb.2.2023.03.15.10.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:49:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8E621FFC4;
 Wed, 15 Mar 2023 17:43:32 +0000 (GMT)
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 13/32] include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
Date: Wed, 15 Mar 2023 17:43:12 +0000
Message-Id: <20230315174331.2959-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:49:50 -0000

From: Richard Henderson <richard.henderson@linaro.org>

This macro is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230310195252.210956-4-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index fb338ba576..e0ebedef84 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,8 +59,6 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
-#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
-
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -252,8 +250,6 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
-#define QEMU_PLUGIN_ASSERT(cond)
-
 static inline void qemu_plugin_add_opts(void)
 { }
 
-- 
2.39.2


